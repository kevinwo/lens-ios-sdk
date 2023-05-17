import LensTestData
import XCTest
@testable import Lens

final class ReactionsTests: XCTestCase {
    var reactions: Reactions!
    var mockLensClient: MockLensClient!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockLensClient = MockLensClient()
        Current.lensClient = { self.mockLensClient }
        reactions = Reactions()
    }

    override func tearDownWithError() throws {
        reactions = nil
        mockLensClient = nil
    }

    // MARK: - Tests

    func test_add() async throws {
        // given
        let request = ReactionRequest(profileId: "0x0", reaction: .init(.upvote), publicationId: "0x12345")

        let data = Stubs.Reaction.add200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = AddReactionMutation.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when/then
        // it should complete adding a reaction
        XCTAssertNoThrow(Task(priority: .medium) {
            try await self.reactions.add(request: request)

            // it should submit a mutation request
            XCTAssertTrue(mockLensClient.invokedRequestMutation)
        })
    }

    func test_remove() async throws {
        // given
        let request = ReactionRequest(profileId: "0x0", reaction: .init(.upvote), publicationId: "0x12345")

        let data = Stubs.Reaction.remove200ResponseJSON()
        let dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])

        let json = JSONValue(dict["data"])
        let expectedResults = RemoveReactionMutation.Data(
            _dataDict: .init(
                data: try .init(_jsonValue: json)
            )
        )
        mockLensClient.stubbedRequestQueryData = expectedResults

        // when/then
        // it should complete removing a reaction
        XCTAssertNoThrow(Task(priority: .medium) {
            try await self.reactions.remove(request: request)

            // it should submit a mutation request
            XCTAssertTrue(mockLensClient.invokedRequestMutation)
        })
    }
}
