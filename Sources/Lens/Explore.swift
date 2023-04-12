import Foundation

public class Explore {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsQuery.Data.ExplorePublications {
        let query = ExplorePublicationsQuery(request: request)
        let data = try await client.request(query: query)

        return data.explorePublications
    }
}
