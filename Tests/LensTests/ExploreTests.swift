import XCTest
@testable import Lens

final class ExploreTests: XCTestCase {
    var explore: Explore!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        explore = Explore()
    }

    override func tearDownWithError() throws {
        explore = nil
    }

    // MARK: - Tests

    func test_publications() async throws {
        // given
        let request = ExplorePublicationRequest(sortCriteria: .init(.latest), sources: .null, customFilters: .null)

        let data = Stubs.explorePublications200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = ExplorePublicationsQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await explore.publications(request: request)

        // then
        // it should fetch a valid set of publications
        let expectedResponse = ExplorePublicationsResponse(response: expectedResults.explorePublications)
        XCTAssertEqual(response, expectedResponse)
    }
}
