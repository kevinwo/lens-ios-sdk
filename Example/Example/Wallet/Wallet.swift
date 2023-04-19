import Foundation
import MagicSDK
import MagicSDK_Web3

final class Wallet {
    // MARK: - Enums

    enum Error: Swift.Error {
        case failedToFetchAddress
        case failedToSignIn
        case failedToSignOut
        case failedToDecodeResponse(String)
        case invalidMessageData
    }

    // MARK: - Properties

    private let magic: Magic! = Magic.shared

    // MARK: - Internal interface

    func address() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            _ = magic.user.getMetadata().done { metadata in
                guard let address = metadata.publicAddress else {
                    continuation.resume(throwing: Error.failedToFetchAddress)
                    return
                }
                continuation.resume(with: .success(address))
            }
        }
    }

    func isSignedIn() async -> Bool {
        return await withCheckedContinuation { continuation in
            _ = Magic.shared.user.isLoggedIn().done { isLoggedIn in
                continuation.resume(returning: isLoggedIn)
            }
        }
    }

    func signIn() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            magic.wallet.connectWithUI { resp in
                if
                    resp.status.isSuccess,
                    let walletAddress = resp.result?.first {
                    continuation.resume(with: .success(walletAddress))
                } else {
                    continuation.resume(throwing: Error.failedToSignIn)
                }
            }
        }
    }

    func signOut() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            magic.wallet.disconnect { resp in
                if resp.status.isSuccess {
                    continuation.resume(with: .success(()))
                } else {
                    continuation.resume(throwing: Error.failedToSignOut)
                }
            }
        }
    }

    func personalSign(message: String) async throws -> String {
        guard let messageData = message.data(using: .utf8) else {
            throw Error.invalidMessageData
        }

        let address = try await address()

        return try await withCheckedThrowingContinuation { continuation in
            do {
                let account = try EthereumAddress(ethereumValue: address)
                let web3 = Web3(provider: magic.rpcProvider)

                _ = web3.eth.sign(
                    from: account,
                    message: try EthereumData(messageData)
                ).done({ response in
                    continuation.resume(with: .success(response.hex()))
                })
            } catch let DecodingError.typeMismatch(_, context)  {
                continuation.resume(throwing: Error.failedToDecodeResponse(context.debugDescription))
            } catch {
                continuation.resume(with: .failure(error))
            }
        }
    }

    func signTypedData(_ json: String) async throws -> String {
        let address = try await address()

        return try await withCheckedThrowingContinuation { continuation in
            do {
                let account = try EthereumAddress(ethereumValue: address)
                let typedData = json.data(using: .utf8)!
                let typedDataV4 = try JSONDecoder().decode(EIP712TypedData.self, from: typedData)
                let web3 = Web3(provider: magic.rpcProvider)

                _ = web3.eth.signTypedDataV4(
                    account: account,
                    data: typedDataV4
                ).done({ response in
                    continuation.resume(with: .success(response.hex()))
                })
            } catch let DecodingError.typeMismatch(_, context)  {
                continuation.resume(throwing: Error.failedToDecodeResponse(context.debugDescription))
            } catch {
                continuation.resume(with: .failure(error))
            }
        }
    }
}
