import Foundation

open class Publication {
    public let id: String
    public let profile: any Profile
    public let metadata: any Metadata
    public let createdAt: String

    init(publication: any AnyPublication) {
        self.id = publication.id
        self.profile = publication.profile
        self.metadata = publication.metadata
        self.createdAt = publication.createdAt
    }

    static func fromItem(_ item: ExplorePublicationsQuery.Data.ExplorePublications.Item) -> Publication? {
        switch item.__typename {
        case "Post": return Post(item: item)
        case "Comment": return Comment(item: item)
        case "Mirror": return Mirror(item: item)
        default: return nil
        }
    }
}
