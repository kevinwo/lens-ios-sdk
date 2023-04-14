import Foundation

public protocol ExploreType {
    func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsResponse
}

public class Explore: ExploreType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsResponse {
        let query = ExplorePublicationsQuery(request: request)
        let data = try await client.request(query: query)

        return ExplorePublicationsResponse(response: data.explorePublications)
    }
}

public struct ExplorePublicationsResponse: Codable {
    public let items: [Publication]
    // TODO: Handle pageInfo/other properties

    init(response: ExplorePublicationsQuery.Data.ExplorePublications) {
        self.items = response.items.compactMap { Publication.fromItem($0) }
    }
}
