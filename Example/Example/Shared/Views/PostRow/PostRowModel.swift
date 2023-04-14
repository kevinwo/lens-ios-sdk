import Foundation
import Lens

final class PostRowModel: PublicationRowModel {
    // MARK: - Properties

    let publication: Post

    // MARK: - Object life cycle

    init(post: Post) {
        self.publication = post
    }
}
