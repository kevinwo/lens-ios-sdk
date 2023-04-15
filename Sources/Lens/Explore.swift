import Foundation

public protocol AnyPost {}

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost: AnyPost {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost: AnyPost {}

public typealias AnyPublication = ExplorePublicationsQuery.Data.ExplorePublications.Item
public typealias AnyComment = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment

public protocol ExploreType {
    func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsQuery.Data.ExplorePublications
}

public class Explore: ExploreType {
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
