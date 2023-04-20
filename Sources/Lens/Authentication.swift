import Foundation

public protocol AuthenticationType {
    func challenge(address: EthereumAddress) async throws -> String
    func authenticate(address: EthereumAddress, signature: Signature) async throws
    func refresh() async throws
    func verify() async throws -> Bool
}

protocol AuthenticationTypeInternal {
    var accessToken: String? { get }
    var refreshToken: String? { get }
}

public class Authentication: AuthenticationType, AuthenticationTypeInternal {
    // MARK: - Enums

    enum Error: Swift.Error {
        case refreshTokenNotPresent
        case accessTokenNotPresent
    }

    // MARK: - Properties

    var accessToken: String? {
        try? keychain.get(Keychain.Key.accessToken)
    }

    var refreshToken: String? {
        try? keychain.get(Keychain.Key.refreshToken)
    }

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

    public func refresh() async throws {
        guard let refreshToken else {
            throw Error.refreshTokenNotPresent
        }

        let mutation = RefreshMutation(request: .init(refreshToken: refreshToken))
        let data = try await client.request(mutation: mutation)

        try keychain.set(data.refresh.accessToken, key: Keychain.Key.accessToken)
        try keychain.set(data.refresh.refreshToken, key: Keychain.Key.refreshToken)
    }

    public func verify() async throws -> Bool {
        guard let accessToken else {
            throw Error.accessTokenNotPresent
        }

        let query = VerifyQuery(request: .init(accessToken: accessToken))
        let data = try await client.request(query: query)

        return data.verify
    }
}
