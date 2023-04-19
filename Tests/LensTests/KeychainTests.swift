import XCTest
@testable import Lens

final class KeychainTests: XCTestCase {
    var keychain: Keychain!

    // MARK: - Tests

    override func setUpWithError() throws {
        keychain = Keychain()
    }

    override func tearDownWithError() throws {
        keychain = nil
    }

    // MARK: - Test life cycle

    func test_set_and_get() throws {
        // given
        let key = "coolKey"
        let value = "cool value"

        // when
        try keychain.set(value, key: key)
        let result = try keychain.get(key)

        // then
        XCTAssertEqual(result, value)
    }
}
