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
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // MARK: - Tests

    func test_fetchPublications() async throws {
        // given
        let data = Stubs.Explore.publicationsItemsJSON()
        let items = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyHashable]

        let json = JSONValue(items)
        let expectedResults = ExplorePublicationsQuery.Data.ExplorePublications(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockExplore.stubbedPublicationsResults = expectedResults

        // when
        await viewModel.fetchPublications()

        // then
        XCTAssertEqual(viewModel.publications, expectedResults.items)
    }
}
