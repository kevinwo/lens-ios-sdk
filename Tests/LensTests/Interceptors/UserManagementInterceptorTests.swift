import Apollo
import XCTest
@testable import Lens

final class UserManagementInterceptorTests: XCTestCase {
    var interceptor: UserManagementInterceptor!
    var mockAuthentication: MockAuthentication!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockAuthentication = MockAuthentication()
        interceptor = UserManagementInterceptor(authentication: mockAuthentication)
    }

    override func tearDownWithError() throws {
        interceptor = nil
    }

    // MARK: - Tests

    func test_interceptAsync_whenAccessTokenIsPresent_andIsNotExpired() throws {
        // given
        let accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjQ4MzgwMzc4MjcsImV4cCI6NDg2OTU3MzgyNywiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiY29vbEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.kqosgqVA6ATpR_6L6DjfNNHfBFTaX4t9heDtm5fs_f8"
        mockAuthentication.stubbedAccessToken = accessToken

        let mockRequestChain = MockRequestChain()
        mockRequestChain.stubbedProceedAsyncCompletionResult = proceedAsyncResultForVerifyRequest()

        let request = verifyRequest(accessToken)

        let expectation = XCTestExpectation(description: "Chain proceeds")
        let chainProceedHandler = {
            expectation.fulfill()
        }

        // when
        interceptor.interceptAsync(
            chain: mockRequestChain,
            request: request,
            response: nil,
            completion: { result in
                chainProceedHandler()
            }
        )

        // then
        wait(for: [expectation], timeout: 5)

        // it should not refresh the access token
        XCTAssertFalse(mockAuthentication.invokedRefresh)

        // it should proceed with the request chain
        XCTAssertTrue(mockRequestChain.invokedProceedAsync)

        // it should set the access token as the authorization header
        guard let request = mockRequestChain.invokedProceedAsyncRequest as? Apollo.JSONRequest<Lens.VerifyQuery> else {
            XCTFail("Invalid request type")
            return
        }
        XCTAssertEqual(request.additionalHeaders["Authorization"], "Bearer \(accessToken)")
    }

    func test_interceptAsync_whenAccessTokenIsPresent_andIsExpired() throws {
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjB4ZWVGYzIzRkU0OWJEZTFmNzk1YzY1MDUwMWFEQjFERWUxRThiNkQ5ZSIsInJvbGUiOiJub3JtYWwiLCJpYXQiOjE2ODIzNjU0MzcsImV4cCI6MTY4MjM2NzIzN30.VlfUALvGLjqazOyblFgY_bnhDmdPr5rE00BZhtKco9M"
        mockAuthentication.stubbedAccessToken = accessToken

        let newAccessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjQ4MzgwMzc4MjcsImV4cCI6NDg2OTU3MzgyNywiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiY29vbEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.kqosgqVA6ATpR_6L6DjfNNHfBFTaX4t9heDtm5fs_f8"
        mockAuthentication.stubbedRefreshAccessToken = newAccessToken

        let mockRequestChain = MockRequestChain()
        mockRequestChain.stubbedProceedAsyncCompletionResult = proceedAsyncResultForVerifyRequest()

        let request = verifyRequest(accessToken)

        let expectation = XCTestExpectation(description: "Chain proceeds")
        let chainProceedHandler = {
            expectation.fulfill()
        }

        // when
        interceptor.interceptAsync(
            chain: mockRequestChain,
            request: request,
            response: nil,
            completion: { result in
                chainProceedHandler()
            }
        )

        // then
        wait(for: [expectation], timeout: 5)

        // it should refresh the access token
        XCTAssertTrue(mockAuthentication.invokedRefresh)

        // it should proceed with the request chain
        XCTAssertTrue(mockRequestChain.invokedProceedAsync)

        // it should set the refreshdd access token as the authorization header
        guard let request = mockRequestChain.invokedProceedAsyncRequest as? Apollo.JSONRequest<Lens.VerifyQuery> else {
            XCTFail("Invalid request type")
            return
        }
        XCTAssertEqual(request.additionalHeaders["Authorization"], "Bearer \(newAccessToken)")
    }

    func test_interceptAsync_whenAccessTokenIsPresent_andIsExpired_andTheIncomingRequestIsToRefreshTheAuthTokens() throws {
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjB4ZWVGYzIzRkU0OWJEZTFmNzk1YzY1MDUwMWFEQjFERWUxRThiNkQ5ZSIsInJvbGUiOiJub3JtYWwiLCJpYXQiOjE2ODIzNjU0MzcsImV4cCI6MTY4MjM2NzIzN30.VlfUALvGLjqazOyblFgY_bnhDmdPr5rE00BZhtKco9M"
        mockAuthentication.stubbedAccessToken = accessToken

        let mockRequestChain = MockRequestChain()
        mockRequestChain.stubbedProceedAsyncCompletionResult = try proceedAsyncResultForRefreshRequest()

        let request = refreshRequest(accessToken)

        let expectation = XCTestExpectation(description: "Chain proceeds")
        let chainProceedHandler = {
            expectation.fulfill()
        }

        // when
        interceptor.interceptAsync(
            chain: mockRequestChain,
            request: request,
            response: nil,
            completion: { result in
                chainProceedHandler()
            }
        )

        // then
        wait(for: [expectation], timeout: 5)

        // it should not refresh the access token
        XCTAssertFalse(mockAuthentication.invokedRefresh)

        // it should proceed with the request chain
        XCTAssertTrue(mockRequestChain.invokedProceedAsync)
    }

    func test_interceptAsync_whenAccessTokenIsNotPresent() throws {
        // given
        let mockRequestChain = MockRequestChain()
        mockRequestChain.stubbedProceedAsyncCompletionResult = proceedAsyncResultForVerifyRequest()

        let request = verifyRequest("test")

        let expectation = XCTestExpectation(description: "Chain proceeds")
        let chainProceedHandler = {
            expectation.fulfill()
        }

        // when
        interceptor.interceptAsync(
            chain: mockRequestChain,
            request: request,
            response: nil,
            completion: { result in
                chainProceedHandler()
            }
        )

        // then
        wait(for: [expectation], timeout: 5)

        // it should proceed with the request chain
        XCTAssertTrue(mockRequestChain.invokedProceedAsync)

        // it should not set a access token as the authorization header
        guard let request = mockRequestChain.invokedProceedAsyncRequest as? Apollo.JSONRequest<Lens.VerifyQuery> else {
            XCTFail("Invalid request type")
            return
        }
        XCTAssertNil(request.additionalHeaders["Authorization"])
    }

    // MARK: - Private interface

    private func proceedAsyncResultForVerifyRequest() -> Any {
        let verifyData = Lens.VerifyQuery.Data(_dataDict: .init(data: .init([("verify", false)])))

        return GraphQLResult(data: verifyData, extensions: nil, errors: nil, source: .server, dependentKeys: nil)
    }

    private func verifyRequest(_ accessToken: String) -> Apollo.JSONRequest<Lens.VerifyQuery> {
        Apollo.JSONRequest<Lens.VerifyQuery>(
            operation: .init(request: .init(accessToken: accessToken)),
            graphQLEndpoint: URL(string: "https://api-mumbai.lens.dev")!,
            clientName: "com.kevinwolkober.Example-apollo-ios",
            clientVersion: "1.0-1"
        )
    }

    private func proceedAsyncResultForRefreshRequest() throws -> Any {
        let dict = [
            "refresh": [
                "accessToken": "newAccessToken",
                "refreshToken": "newRefreshToken"
            ]
        ]
        let json = JSONValue(dict)
        let verifyData = Lens.RefreshMutation.Data(_dataDict: .init(data: try .init(_jsonValue: json)))

        return GraphQLResult(data: verifyData, extensions: nil, errors: nil, source: .server, dependentKeys: nil)
    }

    private func refreshRequest(_ accessToken: String) -> Apollo.JSONRequest<Lens.RefreshMutation> {
        Apollo.JSONRequest<Lens.RefreshMutation>(
            operation: .init(request: .init(refreshToken: "arefreshtoken")),
            graphQLEndpoint: URL(string: "https://api-mumbai.lens.dev")!,
            clientName: "com.kevinwolkober.Example-apollo-ios",
            clientVersion: "1.0-1"
        )
    }
}
