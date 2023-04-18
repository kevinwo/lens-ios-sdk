import Foundation

public protocol AuthenticationType {
    func challenge(address: EthereumAddress) async throws -> String
}

public class Authentication: AuthenticationType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func challenge(address: EthereumAddress) async throws -> String {
        let query = ChallengeQuery(request: .init(address: address))
        let data = try await client.request(query: query)

        return data.challenge.text
    }
}
