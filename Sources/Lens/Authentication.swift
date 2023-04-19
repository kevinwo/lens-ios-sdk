import Foundation

public protocol AuthenticationType {
    func challenge(address: EthereumAddress) async throws -> String
    func authenticate(address: EthereumAddress, signature: Signature) async throws
}

public class Authentication: AuthenticationType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()
    private let keychain: KeychainType = Current.keychain()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func challenge(address: EthereumAddress) async throws -> String {
        let query = ChallengeQuery(request: .init(address: address))
        let data = try await client.request(query: query)

        return data.challenge.text
    }

    public func authenticate(address: EthereumAddress, signature: Signature) async throws {
        let mutation = AuthenticateMutation(request: .init(address: address, signature: signature))
        let data = try await client.request(mutation: mutation)

        try keychain.set(data.authenticate.accessToken, key: Keychain.Key.accessToken)
        try keychain.set(data.authenticate.refreshToken, key: Keychain.Key.refreshToken)
    }
}
