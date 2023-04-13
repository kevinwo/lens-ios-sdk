import Lens

public final class MockExplore: ExploreType {
    // MARK: - Enums

    public enum Error: Swift.Error {
        case publicationsStubNotPresent
    }

    // MARK: - Properties

    public var invokedPublications = false
    public var stubbedPublicationsResults: ExplorePublicationsQuery.Data.ExplorePublications?
    public var publicationsLoadCompletion: (() -> Void)?

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsQuery.Data.ExplorePublications {
        invokedPublications = true

        if let stubbedPublicationsResults {
            publicationsLoadCompletion?()
            return stubbedPublicationsResults
        } else {
            throw Error.publicationsStubNotPresent
        }
    }
}
