import XCTest
import LensTestTools
@testable import Lens
@testable import Example

final class ExplorePublicationsViewModelTests: XCTestCase {
    var viewModel: ExplorePublicationsViewModel!
    var mockExplore: MockExplore!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        viewModel = ExplorePublicationsViewModel()
        mockExplore = MockExplore()
        Current.explore = mockExplore
        // TODO: Add test observer with world reset before each test run
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockExplore = nil
    }

    // MARK: - Tests

    func test_fetchPublications_whenNoPublicationsAreFetched() async throws {
        // given
        mockExplore.stubbedPublicationsResults = try Stubs.Explore.emptyPublications()

        // when
        await viewModel.fetchPublications()

        // then
        XCTAssertTrue(viewModel.publications.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_fetchPublications_whenPublicationsAreFetched() async throws {
        // given
        let expectedResults = try Stubs.Explore.publications()
        mockExplore.stubbedPublicationsResults = expectedResults

        // when
        await viewModel.fetchPublications()

        // then
        let expectedResponse = ExplorePublicationsResponse(response: expectedResults)
        XCTAssertEqual(viewModel.publications, expectedResponse.items)
        XCTAssertFalse(viewModel.isLoading)
    }
}
