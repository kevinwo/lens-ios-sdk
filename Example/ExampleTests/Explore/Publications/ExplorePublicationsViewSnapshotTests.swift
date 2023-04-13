import LensTestTools
import SnapshotTesting
import SwiftUI
import XCTest
@testable import Lens
@testable import Example

final class ExplorePublicationsViewSnapshotTests: XCTestCase {
    var viewModel: ExplorePublicationsViewModel!
    var mockExplore: MockExplore!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        viewModel = ExplorePublicationsViewModel()
        mockExplore = MockExplore()
        Current.explore = mockExplore
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockExplore = nil
    }

    // MARK: - Tests

    func test_whenSortCriteriaIsTopCommented() throws {
        // given
        viewModel.sortCriteria = .topCommented
        mockExplore.stubbedPublicationsResults = try Stubs.Explore.publications()

        // when
        let view = ExplorePublicationsView(viewModel: viewModel)
        let controller = view.prepareForSnapshotting()

        // then
        let expectation = XCTestExpectation(description: "Publication load completes")
        mockExplore.publicationsLoadCompletion = {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        assertSnapshot(
            matching: controller,
            as: .wait(for: 0.1, on: .image)
        )
    }
}
