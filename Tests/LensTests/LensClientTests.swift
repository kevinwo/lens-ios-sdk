import ApolloAPI
import XCTest
@testable import Lens

final class LensClientTests: XCTestCase {
    var client: LensClient!
    var mockApolloClient: MockApolloClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockApolloClient = MockApolloClient()
        Current.apolloClient = mockApolloClient
        client = LensClient()
    }

    // MARK: - Tests

    func test_query() async throws {
        // given
        let query = MockChallengeQuery(request: .init(address: "0x0"))
        let expectedMessage = "Here's a cool challenge message to sign"
        let result = MockChallengeQuery.Data(_dataDict: .init(data: .init([("message", expectedMessage)])))
        mockApolloClient.stubFetchResult(result, forQuery: query)

        // when
        let data = try await client.request(query: query)

        // then
        XCTAssertEqual(data.message, expectedMessage)
    }
}
