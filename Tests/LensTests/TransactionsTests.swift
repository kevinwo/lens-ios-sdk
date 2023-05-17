import LensTestData
import SnapshotTesting
import XCTest
@testable import Lens

final class TransactionsTests: XCTestCase {
    var transactions: Transactions!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        transactions = Transactions()
    }

    override func tearDownWithError() throws {
        transactions = nil
    }

    // MARK: - Tests

    func test_broadcast() async throws {
        // given
        let broadcastId = "550e8400-e29b-41d4-a716-446655440000"
        let signature = "0x8b7a55ecf5e9d5ebe6a8ba7a506a6c86e56988069752b8f7467d267731e1d9aa3f2ed050ee3e05a6f86dc6b1b6ec8a7f3d98aa258a7d3a6a8d7e2b2d2f7fb07123"
        let request = BroadcastRequest(id: broadcastId, signature: signature)

        let expectedResults = try Stubs.Transactions.broadcast()
        mockLensClient.stubbedRequestMutationData = expectedResults

        // when
        let txHash = try await transactions.broadcast(request: request)

        // then
        // it should broadcast
        XCTAssertTrue(mockLensClient.invokedRequestMutation)

        // it should complete with a transaction hash
        XCTAssertEqual(txHash, expectedResults.broadcast.asRelayerResult?.txHash)
    }
}
