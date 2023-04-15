import Foundation

open class Publication {
    public let id: String
    public let profile: any Profile
    public let metadata: any Metadata
    public let createdAt: String

    init(publication: any SomePublication) {
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

public protocol SomePublication {
    associatedtype P: Profile
    associatedtype M: Metadata

    var id: String { get }
    var profile: P { get }
    var metadata: M { get }
    var createdAt: String { get }
}


// MARK: - Post
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost: SomePublication {}

// MARK: - Comment
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment: SomePublication {}

// MARK: - Mirror
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror: SomePublication {}
