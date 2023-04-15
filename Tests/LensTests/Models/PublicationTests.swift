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
}
