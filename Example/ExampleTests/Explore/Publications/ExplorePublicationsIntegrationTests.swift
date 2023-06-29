import ViewInspector
import XCTest
@testable import LensTestData
@testable import LensTestTools
@testable import Example

final class ExplorePublicationsIntegrationTests: XCTestCase {
    var view: ExplorePublicationsView!
    var mockExplore: MockExplore!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockExplore = MockExplore()
        Current.explore = mockExplore

        view = ExplorePublicationsView.view()
    }

    override func tearDownWithError() throws {
        view = nil
        mockExplore = nil
    }

    // MARK: - Tests

    /// The state tests are an alternative to the snapshot tests. I'm interested in exploring
    /// the ViewInspector library for the first time. I generally prefer snapshot tests
    /// though, if kept cheap, as they capture more comprehensive screen state.
    func test_whenStateIsLoading() throws {
        // given
        ViewHosting.host(view: view)

        // when
        view.viewModel.state = .isLoading

        // then
        // it should have a progress view
        XCTAssertNoThrow(try view.inspect().vStack().progressView(0))

        // it should not have a list view
        XCTAssertThrowsError(try view.inspect().vStack().list(0))
    }

    func test_whenStateHasNoPublications() throws {
        // given
        ViewHosting.host(view: view)

        // when
        view.viewModel.state = .noPublications

        // then
        // it should not have a progress view
        XCTAssertThrowsError(try view.inspect().vStack().progressView(0))

        // it should have a text view explaining no publications are available
        XCTAssertNoThrow(try view.inspect().vStack().find(text: "There are no publications to explore right now."))
    }

    func test_whenStateHasPublications() throws {
        // given
        ViewHosting.host(view: view)

        // when
        view.viewModel.state = .hasPublications

        // then
        // it should not have a progress view
        XCTAssertThrowsError(try view.inspect().vStack().progressView(0))

        // it should have a list view
        XCTAssertNoThrow(try view.inspect().vStack().list(0))
    }

    func test_whenStateHasPublications_andTheFirstRowUpvoteButtonIsTapped() throws {
        throw XCTSkip("Disabled; There appears to be an issue with Swift packages and duplicate symbols being produced when a given package is shared across multiple other packages used in a test target. Therefore, we're currently unable to achieve conditional casting in production code when running tests as one type is compared against an incorrect duplicate type, causing tests to fail. Marking as TODO to work around.")

        // given
        mockExplore.stubbedPublicationsResults = try Stubs.Explore.publications()
        ViewHosting.host(view: view)

        waitForState(.hasPublications)
        let list = try view.inspect().vStack().list(0)
        let row = try list.forEach(0).anyView(0)
        let button = try row.find(viewWithTag: "heart").button()

        // when
        try button.tap()

        // then
        // TODO: Verify upvote is triggered and heart state is updated
    }

    // MARK: - Private interface

    func waitForState(_ expectedState: ExplorePublicationsViewModel.State) {
        let expectation = XCTestExpectation(description: "Publication load completes")

        _ = view.viewModel.$state
            .subscribe(on: DispatchQueue.main)
            .sink { state in
                if state == expectedState {
                    expectation.fulfill()
                }
            }

        wait(for: [expectation], timeout: 5)
    }
}
