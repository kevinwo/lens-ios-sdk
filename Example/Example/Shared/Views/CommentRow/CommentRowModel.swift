import Foundation
import Lens

final class CommentRowModel {
    // MARK: - Properties

    let comment: Comment

    var title: String {
        comment.metadata.content ?? ""
    }

    // MARK: - Object life cycle

    init(comment: Comment) {
        self.comment = comment
    }
}
