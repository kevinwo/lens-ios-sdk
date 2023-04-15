import Foundation

public class Mirror: Publication {
    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let mirror = item.asMirror else { return nil }
        super.init(publication: mirror)
    }

    init?(mainPost: ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror) {
        super.init(publication: mainPost)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
