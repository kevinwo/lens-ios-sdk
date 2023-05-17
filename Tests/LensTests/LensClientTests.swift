import Apollo
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

    func test_configure() throws {
        // given
        LensClient.appName = nil
        let appName = "Cool App"
        let appBundleIdentifier = Bundle.main.bundleIdentifier

        // when
        LensClient.configure(appName: appName, appBundleIdentifier: appBundleIdentifier)

        // then
        // it should set the app name
        XCTAssertEqual(LensClient.appName, appName)

        // it should set the app bundle identifier
        XCTAssertEqual(LensClient.appBundleIdentifier, appBundleIdentifier)
    }

    func test_query_whenCachePolicyIsDefault() async throws {
        // given
        let query = MockChallengeQuery(request: .init(address: "0x0"))
        let cachePolicy = CachePolicy.default
        let expectedMessage = "Here's a cool challenge message to sign"
        let result = MockChallengeQuery.Data(_dataDict: .init(data: .init([("message", expectedMessage)])))
        mockApolloClient.stubFetchResult(result, forQuery: query)

        // when
        let data = try await client.request(query: query, cachePolicy: cachePolicy)

        // then
        // it should set the default cache policy
        XCTAssertEqual(mockApolloClient.invokedFetchCachePolicy, cachePolicy)

        // it should return response data
        XCTAssertEqual(data.message, expectedMessage)
    }

    func test_query_whenCachePolicyIsIgnoringCacheCompletely() async throws {
        // given
        let query = MockChallengeQuery(request: .init(address: "0x0"))
        let cachePolicy = CachePolicy.fetchIgnoringCacheCompletely
        let expectedMessage = "Here's a cool challenge message to sign"
        let result = MockChallengeQuery.Data(_dataDict: .init(data: .init([("message", expectedMessage)])))
        mockApolloClient.stubFetchResult(result, forQuery: query)

        // when
        let data = try await client.request(query: query, cachePolicy: cachePolicy)

        // then
        // it should set the ignoring cache completely policy
        XCTAssertEqual(mockApolloClient.invokedFetchCachePolicy, cachePolicy)

        // it should return response data
        XCTAssertEqual(data.message, expectedMessage)
    }

    func test_perform() async throws {
        // given
        let mutation = MockAuthenticateMutation()
        let expectedAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
        let expectedRefreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKb2huIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MTYyNDU4MjJ9.sLzUPh0jMdZdS5Z5OcqD5zjM_R7LlJnWjV8xxu76Q1I"
        let dict = [
            "authenticate": [
                "accessToken": expectedAccessToken,
                "refreshToken": expectedRefreshToken
            ]
        ]
        let json = JSONValue(dict)

        let result = MockAuthenticateMutation.Data(_dataDict: .init(data: try .init(_jsonValue: json)))
        mockApolloClient.stubPerformResult(result, forMutation: mutation)

        // when
        let data = try await client.request(mutation: mutation)

        // then
        XCTAssertEqual(data.authenticate.accessToken, expectedAccessToken)
        XCTAssertEqual(data.authenticate.refreshToken, expectedRefreshToken)
    }
}
