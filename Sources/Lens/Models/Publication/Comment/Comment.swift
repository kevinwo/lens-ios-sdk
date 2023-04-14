import Foundation

public class Comment: Publication {
    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let comment = item.asComment else { return nil }
        super.init(publication: comment)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
