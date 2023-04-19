import XCTest
@testable import Lens

final class AuthenticationTests: XCTestCase {
    var authentication: Authentication!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        authentication = Authentication()
    }

    override func tearDownWithError() throws {
        authentication = nil
    }

    // MARK: - Tests

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
}
