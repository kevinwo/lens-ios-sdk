import Foundation
import Lens

final class CommentRowModel: PublicationRowModel {
    // MARK: - Properties

    let publication: Comment

    // MARK: - Object life cycle

    init(comment: Comment) {
        self.publication = comment
    }
}
