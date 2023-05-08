import Foundation
import Lens

final class CommentRowModel: PublicationRowModel<Comment> {
    let mainPostViewModel: PostRowModel?

    init(comment: Comment) {
        // TODO: Support mirror as a main post
        self.mainPostViewModel = {
            if let post = comment.mainPost as? Post {
                return PostRowModel(publication: post)
            } else {
                return nil
            }
        }()

        super.init(publication: comment)
    }
}
