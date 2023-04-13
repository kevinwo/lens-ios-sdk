import Foundation
import Lens
import SwiftUI

struct ExplorePublicationsRow {
    static func forPublication(_ publication: Publication) -> AnyView {
        switch publication.__typename {
        case "Post":
            guard let post = publication.asPost else { return Group {}.typeErased }
            return PostRow.view(post: post).typeErased
        case "Comment":
            guard let comment = publication.asComment else { return Group {}.typeErased }
            return CommentRow.view(comment: comment).typeErased
        default:
            return Group {}.typeErased
        }
    }
}
