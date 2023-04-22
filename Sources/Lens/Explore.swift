import Foundation

public protocol ExploreType {
    func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsResponse
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

     - Returns: A response containing publications and page info (todo: the latter)
     */
    public func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsResponse {
        let query = ExplorePublicationsQuery(request: request)
        let data = try await client.request(query: query)

        return ExplorePublicationsResponse(response: data.explorePublications)
    }
}

public struct ExplorePublicationsResponse: Equatable {
    public let items: [Publication]
    // TODO: Handle pageInfo/other properties
    init(response: ExplorePublicationsQuery.Data.ExplorePublications) {
        self.items = response.items.compactMap { Publication.fromItem($0) }
    }
}
