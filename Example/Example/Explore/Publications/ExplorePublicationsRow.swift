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
            return Text(publication.asComment?.metadata.content ?? "No comment").typeErased
        default:
            return Group {}.typeErased
        }
    }
}
