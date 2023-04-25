import Foundation

public protocol AuthenticationType {
    func challenge(address: EthereumAddress) async throws -> String
    func authenticate(address: EthereumAddress, signature: Signature) async throws
    func refresh() async throws -> String
    func verify() async throws -> Bool
    func clear() throws
}

protocol AuthenticationTypeInternal {
    var accessToken: String? { get }
    var refreshToken: String? { get }
}

/**
 Authenticate with Lens and manage authentication state
 */
public class Authentication: AuthenticationType, AuthenticationTypeInternal {
    // MARK: - Enums

    enum Error: Swift.Error {
        case refreshTokenNotPresent
    }

    // MARK: - Properties

    var accessToken: String? {
        try? keychain.get(Keychain.Key.accessToken)
    }

    var refreshToken: String? {
        try? keychain.get(Keychain.Key.refreshToken)
    }

    private var accessTokenIsValid: Bool {
        guard
            let token = try? keychain.get(Keychain.Key.accessToken),
            let jwt = try? JSONWebToken(token)
        else {
            return false
        }
        return !jwt.isExpired
    }

    private let client: LensClientType = Current.lensClient()
    private let keychain: KeychainType = Current.keychain()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    /**
     Generate a sign-in challenge message based on Sign In With Ethereum (EIP-4361)

     - Parameters:
       - address: The address for the wallet with which you wish to sign the sign-in challenge message

     - Returns: The challenge message to sign with a wallet
     */
    public func challenge(address: EthereumAddress) async throws -> String {
        let query = ChallengeQuery(request: .init(address: address))
        let data = try await client.request(query: query)

        return data.challenge.text
    }

    /**
     Authenticate with Lens after having signed the sign-in challenge message.

     If authentication is successful, an access token and refresh token are returned from the Lens API, and the SDK securely stores them both in the Keychain.

     - Parameters:
       - address: The address of the wallet with which signed the sign-in challenge message
       - signature: The signature generated as a result of signing the message with a wallet
     */
    public func authenticate(address: EthereumAddress, signature: Signature) async throws {
        let mutation = AuthenticateMutation(request: .init(address: address, signature: signature))
        let data = try await client.request(mutation: mutation)

        try keychain.set(data.authenticate.accessToken, key: Keychain.Key.accessToken)
        try keychain.set(data.authenticate.refreshToken, key: Keychain.Key.refreshToken)
    }

    /**
     Refresh both the access token and refresh token using your current refresh token (if not yet expired)

     No parameters are needed as current refresh token is retrieved internally from the Keychain. Upon refresh, the new access token and refresh token are stored in the Keychain.

     - Returns: A new access token
     */
    public func refresh() async throws -> String {
        guard let refreshToken else {
            throw Error.refreshTokenNotPresent
        }

        let mutation = RefreshMutation(request: .init(refreshToken: refreshToken))
        let data = try await client.request(mutation: mutation)

        try keychain.set(data.refresh.accessToken, key: Keychain.Key.accessToken)
        try keychain.set(data.refresh.refreshToken, key: Keychain.Key.refreshToken)

        return data.refresh.accessToken
    }

    /**
     Verify that the current access token is still valid for authenticating with the Lens API.

     While verifying the current access token, if expired, a token refresh will automatically be attempted. Therefore, if verify fails initially, but token refresh succeeds, we should return a valid status.
     */
    public func verify() async throws -> Bool {
        guard let accessToken else {
            return false
        }

        let query = VerifyQuery(request: .init(accessToken: accessToken))
        let data = try await client.request(query: query)

        if !data.verify {
            return accessTokenIsValid
        } else {
            return data.verify
        }
    }

    /**
     Clear the existing access token and refresh token from the Keychain.
     */
    public func clear() throws {
        try keychain.remove(Keychain.Key.accessToken)
        try keychain.remove(Keychain.Key.refreshToken)
    }
}
