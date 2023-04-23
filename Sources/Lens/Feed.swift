import Foundation

public protocol FeedType {
    func fetch(request: FeedRequest) async throws -> FeedResponse
}

/**
 Fetch lists of publications as part of a user profile feed
 */
public class Feed: FeedType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    /**
     Fetches a feed for a user profile

     You create a request using criteria for fetching a user profile's feed. For example, if you wanted to fetch a feed for a profile with ID 0xD1abcd, you could do the following:

     ```swift
     let feed = Feed()
     let request = FeedRequest(profileId: "0xD1abcd")
     let response = try await feed.fetch(request: request)
     ```

     - Parameter request: The request parameters to use when fetching publications
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing publications and page info (todo: the latter)
     */
    public func fetch(request: FeedRequest) async throws -> FeedResponse {
        let query = ProfileFeedQuery(request: request)
        let data = try await client.request(query: query)

        return FeedResponse(response: data.feed)
    }
}

public struct FeedResponse: Equatable {
    /**
     A list of publications contained in the feched feed
     */
    public let items: [Publication]
    // TODO: Handle pageInfo/other properties

    /**
     Creates a new `FeedResponse` object with the given response data.

     - Parameter response: A GraphQL-parsed version of the fetched feed
     */
    init(response: ProfileFeedQuery.Data.Feed) {
        self.items = response.items.compactMap { Publication.fromItem($0.root) }
    }
}
