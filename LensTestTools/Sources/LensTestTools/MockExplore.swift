import Lens

public final class MockExplore: ExploreType {
    // MARK: - Enums

    public enum Error: Swift.Error {
        case publicationsStubNotPresent
    }

    // MARK: - Properties

    public var invokedPublications = false
    public var stubbedPublicationsResponse: ExplorePublicationsResponse?
    public var publicationsLoadCompletion: (() -> Void)?

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func publications(request: ExplorePublicationRequest) async throws -> ExplorePublicationsResponse {
        invokedPublications = true

        if let stubbedPublicationsResponse {
            publicationsLoadCompletion?()
            return stubbedPublicationsResponse
        } else {
            throw Error.publicationsStubNotPresent
        }
    }
}
