import Foundation
import Lens
import SwiftUI

struct ExplorePublicationsRow {
    static func forPublication(_ publication: Publication) -> AnyView {
        switch publication {
        case is Post:
            guard let post = publication as? Post else { return Group {}.typeErased }
            return PostRow.view(post: post).typeErased
        case is Comment:
            guard let comment = publication as? Comment else { return Group {}.typeErased }
            return CommentRow.view(comment: comment).typeErased
        default:
            return Group {}.typeErased
        }
    }
}
