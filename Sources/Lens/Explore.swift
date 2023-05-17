import Foundation

public protocol ExploreType {
    func publications(request: ExplorePublicationRequest, observerId: String?) async throws -> ExplorePublicationsResponse
}

/**
 Explore lists of published content, including publications and profiles
 */
public class Explore: ExploreType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    /**
     Explore publications

     You create a request using criteria for exploring publications. For example, if you wanted to fetch the latest publications, you could do the following:

     ```swift
     let explore = Explore()
     let request = ExplorePublicationRequest(sortCriteria: .latest)
     let response = try await explore.publications(request: request)
     ```

     - Parameters:
        - request: The request parameters to use when fetching publications
        - observerId: The profile ID for the signed-in user making the request (optional). This is used when you want to fetch state based on the user's participation (e.g. whether or not they upvoted a post).
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing publications and page info
     */
    public func publications(request: ExplorePublicationRequest, observerId: String?) async throws -> ExplorePublicationsResponse {
        let query = ExplorePublicationsQuery(
            request: request,
            observerId: .value(for: observerId)
        )
        let data = try await client.request(query: query, cachePolicy: .default)

        return ExplorePublicationsResponse(response: data.explorePublications)
    }
}

public struct ExplorePublicationsResponse: Equatable {
    public let items: [Publication]
    public let pageInfo: PageInfo?

    init(response: ExplorePublicationsQuery.Data.ExplorePublications) {
        self.items = response.items.compactMap { Publication.fromItem($0) }
        self.pageInfo = PageInfo(dataDict: response.pageInfo.__data)
    }
}
