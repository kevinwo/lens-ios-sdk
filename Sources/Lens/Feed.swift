import Foundation

public protocol FeedType {
    func fetch(request: FeedRequest) async throws -> FeedResponse
}

public class Feed: FeedType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    public func fetch(request: FeedRequest) async throws -> FeedResponse {
        let query = ProfileFeedQuery(request: request)
        let data = try await client.request(query: query)

        return FeedResponse(response: data.feed)
    }
}

public struct FeedResponse: Equatable {
    public let items: [Publication]
    // TODO: Handle pageInfo/other properties
    init(response: ProfileFeedQuery.Data.Feed) {
        self.items = response.items.compactMap { Publication.fromItem($0.root) }
    }
}
