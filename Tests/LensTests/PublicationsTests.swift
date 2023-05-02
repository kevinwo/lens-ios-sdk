import XCTest
@testable import Lens

final class PublicationsTests: XCTestCase {
    var publications: Publications!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        publications = Publications()
    }

    override func tearDownWithError() throws {
        publications = nil
    }

    // MARK: - Tests

    func test_fetchAll() async throws {
        // given
        let request = PublicationsQueryRequest(profileId: "0x012345")

        let data = Stubs.Publication.fetchAll200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = PublicationsQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await publications.fetchAll(request: request)

        // then
        // it should fetch a valid set of publications
        let expectedResponse = PublicationsResponse(response: expectedResults.publications)
        XCTAssertEqual(response, expectedResponse)
    }

    func test_fetch() async throws {
        // given
        let publicationId = "0x012345"
        let request = PublicationQueryRequest(publicationId: .init(stringLiteral: publicationId))

        let data = Stubs.Publication.fetch200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = PublicationQuery.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await publications.fetch(request: request)

        // then
        // it should fetch a valid publication
        let expectedResponse = PublicationResponse(publication: expectedResults.publication)
        XCTAssertEqual(response, expectedResponse)
    }
}
