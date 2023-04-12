import XCTest
@testable import Lens
@testable import Example

final class ExplorePublicationsViewModelTests: XCTestCase {
    var viewModel: ExplorePublicationsViewModel!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        viewModel = ExplorePublicationsViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // MARK: - Tests

    func test_fetchPublications() throws {
        XCTAssertNotNil(viewModel)
    }
}
