import Foundation
@testable import Lens

final class MockAuthentication: AuthenticationType, AuthenticationTypeInternal {
    var stubbedAccessToken: String?

    var accessToken: String? {
        stubbedAccessToken
    }

    var stubbedRefreshToken: String?

    var refreshToken: String? {
        stubbedRefreshToken
    }

    // MARK: - Enums

    enum Error: Swift.Error {
        case challengeStubNotPresent
        case verifyStubNotPresent
        case refreshStubNotPresent
    }

    // MARK: - challenge

    var invokedChallenge = false
    var invokedChallengeAddress: String?
    var stubbedChallengeMessage: String?

    func challenge(address: EthereumAddress) async throws -> String {
        invokedChallenge = true
        invokedChallengeAddress = address

        guard let message = stubbedChallengeMessage else {
            throw Error.challengeStubNotPresent
        }

        return message
    }

    // MARK: - authenticate

    var invokedAuthenticate = false
    var invokedAuthenticateAddress: EthereumAddress?
    var invokedAuthenticateSignature: Signature?

    func authenticate(address: EthereumAddress, signature: Signature) async throws {
        invokedAuthenticate = true
        invokedAuthenticateAddress = address
        invokedAuthenticateSignature = signature
    }

    // MARK: - refresh

    var invokedRefresh = false
    var stubbedRefreshAccessToken: String?

    func refresh() async throws -> String {
        invokedRefresh = true

        guard let stubbedRefreshAccessToken else {
            throw Error.refreshStubNotPresent
        }

        return stubbedRefreshAccessToken
    }

    // MARK: - verify

    var invokedVerify = false
    var stubbedVerify: Bool?

    func verify() async throws -> Bool {
        invokedVerify = true
        guard let verify = stubbedVerify else {
            throw Error.verifyStubNotPresent
        }

        return verify
    }

    // MARK: - clear

    var invokedClear = false

    func clear() throws {
        invokedClear = true
    }
}
