import Foundation
@testable import Lens

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

    public func publications(request: ExplorePublicationRequest, observerId: String?) async throws -> ExplorePublicationsResponse {
        invokedPublications = true

        if let stubbedPublicationsResults {
            publicationsLoadCompletion?()
            return ExplorePublicationsResponse(response: stubbedPublicationsResults)
        } else {
            throw Error.publicationsStubNotPresent
        }
    }
}
