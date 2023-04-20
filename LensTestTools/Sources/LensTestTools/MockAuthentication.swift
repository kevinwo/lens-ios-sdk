import Foundation
@testable import Lens

public final class MockAuthentication: AuthenticationType {
    // MARK: - Enums

    public enum Error: Swift.Error {
        case challengeStubNotPresent
        case verifyStubNotPresent
    }

    // MARK: - challenge

    public var invokedChallenge = false
    public var invokedChallengeAddress: String?
    public var stubbedChallengeMessage: String?

    public func challenge(address: EthereumAddress) async throws -> String {
        invokedChallenge = true
        invokedChallengeAddress = address

        guard let message = stubbedChallengeMessage else {
            throw Error.challengeStubNotPresent
        }

        return message
    }

    // MARK: - authenticate

    public var invokedAuthenticate = false
    public var invokedAuthenticateAddress: EthereumAddress?
    public var invokedAuthenticateSignature: Signature?

    public func authenticate(address: EthereumAddress, signature: Signature) async throws {
        invokedAuthenticate = true
        invokedAuthenticateAddress = address
        invokedAuthenticateSignature = signature
    }

    // MARK: - refresh

    var invokedRefresh = false

    public func refresh() async throws {
        invokedRefresh = true
    }

    // MARK: - verify

    var invokedVerify = false
    var stubbedVerify: Bool?

    public func verify() async throws -> Bool {
        invokedVerify = true
        guard let verify = stubbedVerify else {
            throw Error.verifyStubNotPresent
        }

        return verify
    }
}
