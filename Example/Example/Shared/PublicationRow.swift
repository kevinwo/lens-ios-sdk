import Foundation
import Lens
import SwiftUI

struct PublicationRow {
    static func forPublication(_ publication: Publication) -> AnyView {
        if let post = publication as? Post {
            return PostRow.view(post: post).typeErased
        } else if let comment = publication as? Comment {
            return CommentRow.view(comment: comment).typeErased
        } else {
            return Group {}.typeErased
        }
    }
}
