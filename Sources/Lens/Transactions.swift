import Foundation

public class Transactions {
    // MARK: - Enums

    enum Error: Swift.Error {
        case invalidResult
    }

    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func broadcast(request: BroadcastRequest) async throws -> String {
        let mutation = BroadcastMutation(request: request)
        let data = try await client.request(mutation: mutation)

        guard let result = data.broadcast.asRelayerResult else {
            throw Error.invalidResult
        }

        return result.txHash
    }
}
