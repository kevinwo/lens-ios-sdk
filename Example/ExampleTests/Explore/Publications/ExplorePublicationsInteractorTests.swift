@testable import Lens
@testable import LensTestData
@testable import LensTestTools
import XCTest
@testable import Example

final class ExplorePublicationsInteractorTests: XCTestCase {
    var interactor: ExplorePublicationsInteractor!
    var mockExplore: MockExplore!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockExplore = MockExplore()
        Current.explore = mockExplore

        interactor = ExplorePublicationsInteractor()
    }

    override func tearDownWithError() throws {
        interactor = nil
        mockExplore = nil
    }

    // MARK: - Tests

    func test_fetchPublications() async throws {
        // given
        let expectedResults = try Stubs.Explore.publications()
        mockExplore.stubbedPublicationsResults = expectedResults

        // when
        let response = try await interactor.fetchPublications(sortCriteria: .latest)

        // then
        // it should fetch a valid set of publications
        let expectedResponse = ExplorePublicationsResponse(response: expectedResults)
        XCTAssertEqual(response, expectedResponse)

        // it should have page info
        XCTAssertNotNil(response.pageInfo)
    }
}
