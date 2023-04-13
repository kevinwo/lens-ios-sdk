import Foundation
import Lens

final class PostRowModel {
    // MARK: - Properties

    let post: Post

    var title: String {
        post.metadata.content ?? ""
    }

    // MARK: - Object life cycle

    init(post: Post) {
        self.post = post
    }
}
