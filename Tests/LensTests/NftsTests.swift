import LensTestData
import SnapshotTesting
import XCTest
@testable import Lens

final class NftsTests: XCTestCase {
    var nfts: Nfts!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        nfts = Nfts()
    }

    override func tearDownWithError() throws {
        nfts = nil
        mockLensClient = nil
    }

    // MARK: - Tests

    func test_fetch() async throws {
        // given
        let walletAddress = "0x0c0E611A29b339D8c1048F2Edf9d4160A5fb8F22"
        let chainId = 137
        let request = NFTsRequest(ownerAddress: walletAddress, chainIds: [chainId])

        let expectedResults = try Stubs.Nfts.fetch()
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when
        let response = try await nfts.fetch(request: request)

        // then
        // it should fetch a valid set of NFTs
        let expectedResponse = NftsResponse(response: expectedResults.nfts)
        XCTAssertEqual(response, expectedResponse)

        // it should have page info
        XCTAssertNotNil(response.pageInfo)
    }
}
