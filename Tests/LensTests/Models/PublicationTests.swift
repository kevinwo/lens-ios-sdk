import SnapshotTesting
import XCTest
@testable import Lens

final class PublicationTests: XCTestCase {
    func test_fromItem_whenItemIsAPost() throws {
        // given
        let item = try Stubs.Publication.testPost()
        let postItem = item.asPost

        // when
        let post = Publication.fromItem(item)

        // then
        XCTAssertTrue(post is Post)
        // TODO: Write custom snapshot strategy to better capture
        // object state is valid
        XCTAssertEqual(post?.metadata.name, postItem?.metadata.name)
        XCTAssertEqual(post?.metadata.description, postItem?.metadata.description)
        XCTAssertEqual(post?.metadata.content, postItem?.metadata.content)
        XCTAssertEqual(post?.createdAt, postItem?.createdAt)
    }

    func test_fromItem_whenItemIsAComment() throws {
        // given
        let item = try Stubs.Publication.testComment()
        let commentItem = item.asComment

        // when
        let comment = Publication.fromItem(item)

        // then
        XCTAssertTrue(comment is Comment)
        // TODO: Write custom snapshot strategy to better capture
        // object state is valid
        XCTAssertEqual(comment?.metadata.name, commentItem?.metadata.name)
        XCTAssertEqual(comment?.metadata.description, commentItem?.metadata.description)
        XCTAssertEqual(comment?.metadata.content, commentItem?.metadata.content)
        XCTAssertEqual(comment?.createdAt, commentItem?.createdAt)
        // TODO: Restore main post check after fixing GraphQL fulfillment for main post in tests
//        XCTAssertNotNil((comment as? Comment)?.mainPost)
    }
}
