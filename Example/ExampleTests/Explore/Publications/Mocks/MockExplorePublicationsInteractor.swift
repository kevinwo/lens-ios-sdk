import Foundation
@testable import Lens
@testable import Example

final class MockExplorePublicationsInteractor: ExplorePublicationsInteractorType {
    // MARK: - Enums

    enum Error: Swift.Error {
        case publicationsStubNotPresent
    }

    // MARK: - Properties

    var invokedFetchPublications = false
    var stubbedPublicationsResults: ExplorePublicationsQuery.Data.ExplorePublications?
    var fetchPublicationsCompletion: (() -> Void)?

    // MARK: - Internal interface

    func fetchPublications(sortCriteria: Lens.PublicationSortCriteria, cursor: String?) async throws -> ExplorePublicationsResponse {
        if let stubbedPublicationsResults {
            fetchPublicationsCompletion?()
            return ExplorePublicationsResponse(response: stubbedPublicationsResults)
        } else {
            throw Error.publicationsStubNotPresent
        }
    }
}
