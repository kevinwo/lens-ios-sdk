import LensTestData
import SnapshotTesting
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
        let profileId = "0x012345"
        let request = PublicationsQueryRequest(profileId: .init(stringLiteral: profileId))
        let expectedResults = try Stubs.Publication.fetchAllPublications()
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await publications.fetchAll(request: request, observerId: nil)

        // then
        // it should fetch a valid set of publications
        let expectedResponse = PublicationsResponse(response: expectedResults.publications)
        XCTAssertEqual(response, expectedResponse)

        // it should have publications
        XCTAssertFalse(response.publications.isEmpty)

        // it should have page info
        XCTAssertNotNil(response.pageInfo)
    }

    func test_fetch() async throws {
        // given
        let publicationId = "0x012345"
        let request = PublicationQueryRequest(publicationId: .init(stringLiteral: publicationId))
        let expectedResults = try Stubs.Publication.fetchPublication()
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await publications.fetch(request: request, observerId: nil)

        // then
        // it should fetch a valid publication
        let expectedResponse = PublicationResponse(publication: expectedResults.publication)
        XCTAssertEqual(response, expectedResponse)

        // it should have a publication
        XCTAssertNotNil(response.publication)
    }

    @MainActor
    func test_createCollectTypedData() async throws {
        // given
        let publicationId = "0x012345"
        let request = CreateCollectRequest(publicationId: publicationId)
        let expectedResults = try Stubs.Publication.createCollectTypedData()
        mockLensClient.stubbedRequestMutationData = expectedResults

        // when
        let response = try await publications.createCollectTypedData(request: request)

        // then
        // it should have a broadcast ID
        XCTAssertEqual(response.broadcastId, expectedResults.result.id)

        // it should generate valid collect typed data
        let typedData = try XCTUnwrap(response.typedData.data(using: .utf8))
        let json = try JSONSerialization.jsonObject(with: typedData)
        assertSnapshot(matching: json, as: .json)
    }
}
