import SnapshotTesting
import XCTest
@testable import Lens

final class PublicationTests: XCTestCase {
    func test_fromItem_whenItemIsAPost() throws {
        // given
        let item = try Stubs.Publication.testPost()
        let postItem = item.asPost

        // when
        let publication = Publication.fromItem(item)

        // then
        // it should parse as a post
        guard let post = publication as? Post else {
            XCTFail("Parsed publication is not a post")
            return
        }
        // TODO: Write custom snapshot strategy to better capture
        // object state is valid
        XCTAssertEqual(post.publicationId, postItem?.id)
        XCTAssertEqual(post.metadata.name, postItem?.metadata.name)
        XCTAssertEqual(post.metadata.description, postItem?.metadata.description)
        XCTAssertEqual(post.metadata.content, postItem?.metadata.content)
        XCTAssertEqual(post.createdAt, postItem?.createdAt)
        XCTAssertEqual(post.collectModule.type, postItem?.collectModule.type)

        XCTAssertEqual(post.stats.totalUpvotes, postItem?.stats.totalUpvotes)
        XCTAssertEqual(post.stats.totalAmountOfMirrors, postItem?.stats.totalAmountOfMirrors)
        XCTAssertEqual(post.stats.totalAmountOfCollects, postItem?.stats.totalAmountOfCollects)
        XCTAssertEqual(post.stats.totalAmountOfComments, postItem?.stats.totalAmountOfComments)
    }

    func test_fromItem_whenItemIsAComment() throws {
        // given
        let item = try Stubs.Publication.testComment()
        let commentItem = item.asComment

        // when
        let publication = Publication.fromItem(item)

        // then
        // it should parse as a comment
        guard let comment = publication as? Comment else {
            XCTFail("Parsed publication is not a comment")
            return
        }
        // TODO: Write custom snapshot strategy to better capture
        // object state is valid
        XCTAssertEqual(comment.publicationId, commentItem?.id)
        XCTAssertEqual(comment.metadata.name, commentItem?.metadata.name)
        XCTAssertEqual(comment.metadata.description, commentItem?.metadata.description)
        XCTAssertEqual(comment.metadata.content, commentItem?.metadata.content)
        XCTAssertEqual(comment.createdAt, commentItem?.createdAt)
        XCTAssertEqual(comment.collectModule.type, commentItem?.collectModule.type)

        XCTAssertEqual(comment.stats.totalUpvotes, commentItem?.stats.totalUpvotes)
        XCTAssertEqual(comment.stats.totalAmountOfMirrors, commentItem?.stats.totalAmountOfMirrors)
        XCTAssertEqual(comment.stats.totalAmountOfCollects, commentItem?.stats.totalAmountOfCollects)
        XCTAssertEqual(comment.stats.totalAmountOfComments, commentItem?.stats.totalAmountOfComments)
        // TODO: Restore main post check after fixing GraphQL fulfillment for main post in tests
//        XCTAssertNotNil((comment as? Comment)?.mainPost)
    }
}
