import Foundation

public class Mirror: Publication {
    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let mirror = item.asMirror else { return nil }
        super.init(publication: mirror)
    }

    init?(item: PublicationsQuery.Data.Publications.Item) {
        guard let mirror = item.asMirror else { return nil }
        super.init(publication: mirror)
    }

    init?(item: PublicationQuery.Data.Publication) {
        guard let mirror = item.asMirror else { return nil }
        super.init(publication: mirror)
    }

    init(mainPost: any SomePublication) {
        super.init(publication: mainPost)
    }

    @available(*, unavailable)
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
