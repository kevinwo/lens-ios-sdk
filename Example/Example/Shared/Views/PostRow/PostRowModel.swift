import Foundation
import Lens

final class PostRowModel: PublicationRowModel<Post> {
    let isMainPostForComment: Bool

    init(publication: Post, isMainPostForComment: Bool = false) {
        self.isMainPostForComment = isMainPostForComment

        super.init(publication: publication)
    }
}
