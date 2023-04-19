import XCTest
@testable import Lens

final class FeedTests: XCTestCase {
    var feed: Feed!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        feed = Feed()
    }

    override func tearDownWithError() throws {
        feed = nil
    }

    // MARK: - Tests

    func test_feed() async throws {
        // given
        let request = FeedRequest(profileId: "0x06", feedEventItemTypes: .null, sources: .null)

        let data = Stubs.feedFetch200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = ProfileFeedQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await feed.fetch(request: request)

        // then
        // it should fetch a valid set of publications
        let expectedResponse = FeedResponse(response: expectedResults.feed)
        XCTAssertEqual(response, expectedResponse)
    }
}
