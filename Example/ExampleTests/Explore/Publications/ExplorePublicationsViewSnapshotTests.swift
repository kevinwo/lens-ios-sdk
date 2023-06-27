import LensTestData
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
        let interactor = ExplorePublicationsInteractor()
        viewModel = ExplorePublicationsViewModel(interactor: interactor)

        mockExplore = MockExplore()
        Current.explore = mockExplore
    }

    override func tearDownWithError() throws {
        mockExplore = nil
        viewModel = nil
    }

    // MARK: - Tests

    func test_whenNoPublicationsArePresent() throws {
        // given
        mockExplore.stubbedPublicationsResults = try Stubs.Explore.emptyPublications()

        // when
        let view = ExplorePublicationsView(viewModel: self.viewModel)
        let controller = view.prepareForSnapshotting()

        // then
        waitForState(.noPublications)

        assertSnapshot(
            matching: controller,
            as: .wait(for: 0.1, on: .windowedImage)
        )
    }

    func test_whenSortCriteriaIsTopCommented() throws {
        throw XCTSkip("Disabled; This test currently renders a white screen rather than the expected list. Needs investigation re: SwiftUI-specific snapshot tests and marking as TODO.")

        // given
        viewModel.sortCriteria = .topCommented
        mockExplore.stubbedPublicationsResults = try Stubs.Explore.publications()

        // when
        let view = ExplorePublicationsView(viewModel: self.viewModel)
        let controller = view.prepareForSnapshotting()

        // then
        waitForState(.hasPublications)

        assertSnapshot(
            matching: controller,
            as: .wait(for: 0.1, on: .windowedImage)
        )
    }

    // MARK: - Private interface

    func waitForState(_ expectedState: ExplorePublicationsViewModel.State) {
        let expectation = XCTestExpectation(description: "Publication load completes")

        _ = viewModel.$state
            .subscribe(on: DispatchQueue.main)
            .sink { state in
                if state == expectedState {
                    expectation.fulfill()
                }
            }

        wait(for: [expectation], timeout: 5)
    }
}
