import XCTest
@testable import Lens

final class AuthenticationTests: XCTestCase {
    var authentication: Authentication!
    var mockLensClient: MockLensClient!
    var mockKeychain: MockKeychain!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }

        mockKeychain = MockKeychain()
        Current.keychain = { self.mockKeychain }

        authentication = Authentication()
    }

    override func tearDownWithError() throws {
        authentication = nil
        mockKeychain = nil
        mockLensClient = nil
    }

    // MARK: - Tests

    func test_accessToken() throws {
        // given
        let expectedAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
        try mockKeychain.set(expectedAccessToken, key: Keychain.Key.accessToken)

        // when
        let accessToken = authentication.accessToken

        // then
        XCTAssertEqual(accessToken, expectedAccessToken)
    }

    func test_refreshToken() throws {
        // given
        let expectedRefreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKb2huIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MTYyNDU4MjJ9.sLzUPh0jMdZdS5Z5OcqD5zjM_R7LlJnWjV8xxu76Q1I"
        try mockKeychain.set(expectedRefreshToken, key: Keychain.Key.refreshToken)

        // when
        let refreshToken = authentication.refreshToken

        // then
        XCTAssertEqual(refreshToken, expectedRefreshToken)
    }

    func test_challenge() async throws {
        // given
        let address = "0x0"
        let expectedMessage = "Here's a cool challenge message to sign"
        let dict = [
            "challenge": [
                "text": expectedMessage
            ]
        ]
        let json = JSONValue(dict)
        mockLensClient.stubbedRequestQueryData = ChallengeQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )

        // when
        let message = try await authentication.challenge(address: address)

        // then
        // should generate a challenge message to sign with a wallet
        XCTAssertEqual(message, expectedMessage)
    }

    func test_authenticate() async throws {
        // given
        let address = "0x03aF0bE7cE8A33e0c24A0dFfc2Cf9e4aD4A4bAe1"
        let signature = "0x70a08231"
        let expectedAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
        let expectedRefreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKb2huIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MTYyNDU4MjJ9.sLzUPh0jMdZdS5Z5OcqD5zjM_R7LlJnWjV8xxu76Q1I"
        let dict = [
            "authenticate": [
                "accessToken": expectedAccessToken,
                "refreshToken": expectedRefreshToken
            ]
        ]
        let json = JSONValue(dict)
        mockLensClient.stubbedRequestMutationData = AuthenticateMutation.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )

        // when
        try await authentication.authenticate(address: address, signature: signature)

        // then
        // should set the access token and refresh token in the keychain
        XCTAssertEqual(try mockKeychain.get("accessToken"), expectedAccessToken)
        XCTAssertEqual(try mockKeychain.get("refreshToken"), expectedRefreshToken)
    }

    func test_refresh() async throws {
        // given
        let currentRefreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKb2huIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MTYyNDU4MjJ9.sLzUPh0jMdZdS5Z5OcqD5zjM_R7LlJnWjV8xxu76Q1I"
        try mockKeychain.set(currentRefreshToken, key: Keychain.Key.refreshToken)

        let expectedAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQsswNEWCOOLTOKEN"
        let expectedRefreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKb2huIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MTYyNDU4MjJ9.sLzUPh0jMdZdS5Z5OcqD5zjM_R7LlJnWjV8xxu76QNEWCOOLTOKEN"
        let dict = [
            "refresh": [
                "accessToken": expectedAccessToken,
                "refreshToken": expectedRefreshToken
            ]
        ]
        let json = JSONValue(dict)
        mockLensClient.stubbedRequestMutationData = RefreshMutation.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )

        // when
        let newAccessToken = try await authentication.refresh()

        // then
        // should set the refreshed access token and refresh token in the keychain
        XCTAssertEqual(try mockKeychain.get("accessToken"), expectedAccessToken)
        XCTAssertEqual(try mockKeychain.get("refreshToken"), expectedRefreshToken)

        // should return the refreshed access token
        XCTAssertEqual(newAccessToken, expectedAccessToken)
    }

    func test_verify() async throws {
        // given
        let currentAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
        try mockKeychain.set(currentAccessToken, key: Keychain.Key.accessToken)

        let dict = [
            "verify": true
        ]
        let json = JSONValue(dict)
        mockLensClient.stubbedRequestQueryData = VerifyQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )

        // when
        let isVerified = try await authentication.verify()

        // then
        // should verify the access token
        XCTAssertTrue(isVerified)
    }

    func test_clear() throws {
        // given
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
        let refreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKb2huIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MTYyNDU4MjJ9.sLzUPh0jMdZdS5Z5OcqD5zjM_R7LlJnWjV8xxu76Q1I"
        try mockKeychain.set(accessToken, key: Keychain.Key.accessToken)
        try mockKeychain.set(refreshToken, key: Keychain.Key.refreshToken)

        // when
        try authentication.clear()

        // then
        // it should clear the access token and refresh token from the keychain
        XCTAssertNil(try mockKeychain.get("accessToken"))
        XCTAssertNil(try mockKeychain.get("refreshToken"))
    }
}
