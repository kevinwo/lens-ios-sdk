@testable import LensTestData
@testable import LensTestTools
import SnapshotTesting
import SwiftUI
import XCTest
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
        throw XCTSkip("Disabled; There appears to be an issue with Swift packages and duplicate symbols being produced when a given package is shared across multiple other packages used in a test target. Therefore, we're currently unable to achieve conditional casting in production code when running tests as one type is compared against an incorrect duplicate type, causing tests to fail. Marking as TODO to work around.")

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
