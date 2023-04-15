import Foundation

public class Mirror: Publication {
    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let mirror = item.asMirror else { return nil }
        super.init(publication: mirror)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
