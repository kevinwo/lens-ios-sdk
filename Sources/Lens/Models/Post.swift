import Foundation

public class Post: Publication {
    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let post = item.asPost else { return nil }
        super.init(publication: post)
    }

    init?(mainPost: ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost) {
        super.init(publication: mainPost)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
