import Apollo
import XCTest
@testable import Lens

final class UserManagementInterceptorTests: XCTestCase {
    var interceptor: UserManagementInterceptor!
    var mockKeychain: MockKeychain!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockKeychain = MockKeychain()
        Current.keychain = { self.mockKeychain }

        interceptor = UserManagementInterceptor()
    }

    override func tearDownWithError() throws {
        interceptor = nil
        mockKeychain = nil
    }

    // MARK: - Tests

    func test_interceptAsync_whenAccessTokenIsPresent() throws {
        // given
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
        try mockKeychain.set(accessToken, key: Keychain.Key.accessToken)

        let mockRequestChain = MockRequestChain()
        let request = Apollo.JSONRequest<Lens.VerifyQuery>(
            operation: .init(request: .init(accessToken: accessToken)),
            graphQLEndpoint: URL(string: "https://api-mumbai.lens.dev")!,
            clientName: "com.kevinwolkober.Example-apollo-ios",
            clientVersion: "1.0-1"
        )

        // when
        interceptor.interceptAsync(
            chain: mockRequestChain,
            request: request,
            response: nil) { _ in }

        // then
        // it should proceed with the request chain
        XCTAssertTrue(mockRequestChain.invokedProceedAsync)

        // it should set the acess token as the authorization header
        guard let request = mockRequestChain.invokedProceedAsyncRequest as? Apollo.JSONRequest<Lens.VerifyQuery> else {
            XCTFail("Invalid request type")
            return
        }
        XCTAssertEqual(request.additionalHeaders["Authorization"], "Bearer \(accessToken)")
    }

    func test_interceptAsync_whenAccessTokenIsNotPresent() throws {
        // given
        try mockKeychain.remove(Keychain.Key.accessToken)

        let mockRequestChain = MockRequestChain()
        let request = Apollo.JSONRequest<Lens.VerifyQuery>(
            operation: .init(request: .init(accessToken: "test")),
            graphQLEndpoint: URL(string: "https://api-mumbai.lens.dev")!,
            clientName: "com.kevinwolkober.Example-apollo-ios",
            clientVersion: "1.0-1"
        )

        // when
        interceptor.interceptAsync(
            chain: mockRequestChain,
            request: request,
            response: nil) { _ in }

        // then
        // it should proceed with the request chain
        XCTAssertTrue(mockRequestChain.invokedProceedAsync)

        // it should not set a acess token as the authorization header
        guard let request = mockRequestChain.invokedProceedAsyncRequest as? Apollo.JSONRequest<Lens.VerifyQuery> else {
            XCTFail("Invalid request type")
            return
        }
        XCTAssertNil(request.additionalHeaders["Authorization"])
    }
}
