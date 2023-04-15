import Foundation

public class Comment: Publication {
    let mainPost: Publication?

    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let comment = item.asComment else { return nil }
        self.mainPost = {
            if let post = comment.mainPost.asPost {
                return Post(mainPost: post)
            } else if let mirror = comment.mainPost.asMirror {
                return Mirror(mainPost: mirror)
            } else {
                return nil
            }
        }()

        super.init(publication: comment)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
