import Foundation
@testable import Lens

public final class MockAuthentication: AuthenticationType {
    // MARK: - Enums

    public enum Error: Swift.Error {
        case challengeStubNotPresent
    }

    // MARK: - Properties

    var invokedChallenge = false
    var invokedChallengeAddress: String?
    var stubbedChallengeMessage: String?

    // MARK: - Public interface

    public func challenge(address: EthereumAddress) async throws -> String {
        invokedChallenge = true
        invokedChallengeAddress = address

        guard let message = stubbedChallengeMessage else {
            throw Error.challengeStubNotPresent
        }

        return message
    }
}
