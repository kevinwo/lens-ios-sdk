import Foundation
import Lens

protocol ExplorePublicationsInteractorType {
    func fetchPublications(sortCriteria: PublicationSortCriteria, cursor: String?) async throws -> ExplorePublicationsResponse
}

final class ExplorePublicationsInteractor: ExplorePublicationsInteractorType {
    func fetchPublications(sortCriteria: PublicationSortCriteria, cursor: String? = nil) async throws -> ExplorePublicationsResponse {
        let request = ExplorePublicationRequest(
            cursor: (cursor != nil) ? GraphQLNullable(stringLiteral: cursor!) : nil,
            sortCriteria: .init(sortCriteria)
        )
        return try await Current.explore.publications(request: request, observerId: Current.user.profileId)
    }
}
