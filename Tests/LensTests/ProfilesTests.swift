import XCTest
@testable import Lens

final class ProfilesTests: XCTestCase {
    var profiles: Profiles!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        profiles = Profiles()
    }

    override func tearDownWithError() throws {
        profiles = nil
    }

    // MARK: - Tests

    func test_fetchAll() async throws {
        // given
        let request = ProfileQueryRequest(ownedBy: ["0x0"])

        let data = Stubs.Profile.fetchAll200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = ProfilesQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await profiles.fetchAll(request: request)

        // then
        // it should fetch a valid set of profiles
        let expectedResponse = ProfilesResponse(response: expectedResults.profiles)
        XCTAssertEqual(response, expectedResponse)
    }
}
