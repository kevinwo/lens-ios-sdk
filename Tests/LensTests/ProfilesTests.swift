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

    func test_fetch() async throws {
        // given
        let profileId = "0x012345"
        let request = SingleProfileQueryRequest(profileId: .init(stringLiteral: profileId))

        let data = Stubs.Profile.fetch200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = ProfileQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await profiles.fetch(request: request)

        // then
        // it should fetch a valid profile
        let expectedResponse = ProfileResponse(profile: expectedResults.profile)
        XCTAssertEqual(response, expectedResponse)
    }

    func test_create() async throws {
        throw XCTSkip("Disabled; GraphQL fulfillment in tests is currently an issue. Will resolve at a later date and marking as TODO")

        // given
        let request = CreateProfileRequest(handle: "coolhandle")

        let expectedTxHash = "0xd771b9b8fd558eda20598e8a464cc9cc9e28f4bd75e823d30ee276dd590cd67e"
        mockLensClient.stubbedRequestMutationData = try Stubs.Profile.create200()

        // when
        let txHash = try await profiles.create(request: request)

        // then
        // it should provide a blockchain transaction hash upon creation
        XCTAssertEqual(txHash, expectedTxHash)
    }
}
