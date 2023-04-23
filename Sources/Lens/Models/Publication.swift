import Foundation

open class Publication: Identifiable {
    public let id: String
    public let profile: any Profile
    public let metadata: any Metadata
    public let createdAt: String
    public let collectModule: any CollectModule

    init(publication: any SomePublication) {
        self.id = publication.id
        self.profile = publication.profile
        self.metadata = publication.metadata
        self.createdAt = publication.createdAt
        self.collectModule = publication.collectModule
    }

    static func fromItem(_ item: ExplorePublicationsQuery.Data.ExplorePublications.Item) -> Publication? {
        switch item.__typename {
        case "Post": return Post(item: item)
        case "Comment": return Comment(item: item)
        case "Mirror": return Mirror(item: item)
        default: return nil
        }
    }

    static func fromItem(_ item: ProfileFeedQuery.Data.Feed.Item.Root) -> Publication? {
        switch item.__typename {
        case "Post": return Post(item: item)
        case "Comment": return Comment(item: item)
        default: return nil
        }
    }
}

extension Publication: Equatable {
    public static func == (lhs: Publication, rhs: Publication) -> Bool {
        lhs.id == rhs.id
    }
}

public protocol SomePublication {
    associatedtype P: Profile
    associatedtype M: Metadata
    associatedtype C: CollectModule

    var id: String { get }
    var profile: P { get }
    var metadata: M { get }
    var createdAt: String { get }
    var collectModule: C { get }
}

// MARK: - Post

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost: SomePublication {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost: SomePublication {}

// MARK: - Comment

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment: SomePublication {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost: SomePublication {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror: SomePublication {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment: SomePublication {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost: SomePublication {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror: SomePublication {}

// MARK: - Mirror

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror: SomePublication {}
