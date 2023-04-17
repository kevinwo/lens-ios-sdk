import Foundation
import MagicSDK

final class Wallet {
    // MARK: - Enums

    enum Error: Swift.Error {
        case failedToSignIn
        case failedToSignOut
    }

    // MARK: - Internal interface

    func isSignedIn() async -> Bool {
        return await withCheckedContinuation { continuation in
            _ = Magic.shared.user.isLoggedIn().done { isLoggedIn in
                continuation.resume(returning: isLoggedIn)
            }
        }
    }

    func signIn() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            Magic.shared.wallet.connectWithUI { resp in
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
            Magic.shared.wallet.disconnect { resp in
                if resp.status.isSuccess {
                    continuation.resume(with: .success(()))
                } else {
                    continuation.resume(throwing: Error.failedToSignOut)
                }
            }
        }
    }
}
