import XCTest
@testable import LensTestData
@testable import LensTestTools
@testable import Example

final class ExplorePublicationsViewModelTests: XCTestCase {
    var viewModel: ExplorePublicationsViewModel!
    var mockInteractor: MockExplorePublicationsInteractor!
    var triggeredStates: [ExplorePublicationsViewModel.State]!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        triggeredStates = [ExplorePublicationsViewModel.State]()
        mockInteractor = MockExplorePublicationsInteractor()
        viewModel = ExplorePublicationsViewModel(interactor: mockInteractor)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockInteractor = nil
        triggeredStates = nil
    }

    // MARK: - Tests

    func test_onFirstAppear_whenNoPublicationsAreFetched() async throws {
        // given
        let expectation = XCTestExpectation(description: "Publication load completes")

        /// We want to wait until publications complete load before verifying behavior.
        observeStates { currentState in
            if currentState == .noPublications {
                expectation.fulfill()
            }
        }

        mockInteractor.stubbedPublicationsResults = try Stubs.Explore.emptyPublications()

        // when
        viewModel.onFirstAppear()

        // then
        await fulfillment(of: [expectation], timeout: 5)

        // it should trigger loading and complete with no publications
        XCTAssertEqual(triggeredStates, [.isLoading, .noPublications])

        // it should have no publications
        XCTAssertTrue(viewModel.publications.isEmpty)
    }

    func test_onFirstAppear_whenPublicationsAreFetched() async throws {
        // given
        let expectation = XCTestExpectation(description: "Publication load completes")

        /// We want to wait until publications complete load before verifying behavior.
        observeStates { currentState in
            if currentState == .hasPublications {
                expectation.fulfill()
            }
        }

        mockInteractor.stubbedPublicationsResults = try Stubs.Explore.publications()

        // when
        viewModel.onFirstAppear()

        // then
        await fulfillment(of: [expectation], timeout: 5)

        // it should trigger loading and complete with publications
        XCTAssertEqual(triggeredStates, [.isLoading, .hasPublications])

        // it should have publications
        XCTAssertFalse(viewModel.publications.isEmpty)
    }

    // MARK: - Private interface

    func observeStates(expectationHandler: @escaping (ExplorePublicationsViewModel.State) -> Void) {
        _ = viewModel.$state
            .dropFirst(1)
            .subscribe(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self else { return }
                self.triggeredStates.append(state)
                expectationHandler(state)
            }
    }
}
