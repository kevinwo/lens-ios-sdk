import Foundation

open class Publication: Identifiable {
    public let id = UUID()
    public let publicationId: String
    public let profile: any Profile
    public let metadata: any Metadata
    public let createdAt: String
    public let collectModule: any CollectModule
    public let stats: any PublicationStats
    public let reaction: Lens.ReactionTypes?
    public let hasCollectedByMe: Bool

    init(publication: any SomePublication) {
        self.publicationId = publication.id
        self.profile = publication.profile
        self.metadata = publication.metadata
        self.createdAt = publication.createdAt
        self.collectModule = publication.collectModule
        self.stats = publication.stats
        self.reaction = publication.reaction.map { $0.value } ?? nil
        self.hasCollectedByMe = publication.hasCollectedByMe
    }

    static func fromItem(_ item: ExplorePublicationsQuery.Data.ExplorePublications.Item) -> Publication? {
        switch item.__typename {
        case "Post": return Post(item: item)
        case "Comment": return Comment(item: item)
        case "Mirror": return Mirror(item: item)
        default: return nil
        }
    }

    static func fromItem(_ item: ProfileFeedQuery.Data.Feed.Item) -> Publication? {
        switch item.root.__typename {
        case "Post": return Post(item: item)
        case "Comment": return Comment(item: item)
        default: return nil
        }
    }

    static func fromItem(_ item: PublicationsQuery.Data.Publications.Item) -> Publication? {
        switch item.__typename {
        case "Post": return Post(item: item)
        case "Comment": return Comment(item: item)
        case "Mirror": return Mirror(item: item)
        default: return nil
        }
    }

    static func fromItem(_ item: PublicationQuery.Data.Publication) -> Publication? {
        switch item.__typename {
        case "Post": return Post(item: item)
        case "Comment": return Comment(item: item)
        case "Mirror": return Mirror(item: item)
        default: return nil
        }
    }
}

extension Publication: Equatable {
    public static func == (lhs: Publication, rhs: Publication) -> Bool {
        lhs.publicationId == rhs.publicationId
    }
}

public protocol SomePublication {
    associatedtype P: Profile
    associatedtype M: Metadata
    associatedtype C: CollectModule
    associatedtype S: PublicationStats

    var id: String { get }
    var profile: P { get }
    var metadata: M { get }
    var createdAt: String { get }
    var collectModule: C { get }
    var stats: S { get }
    var reaction: GraphQLEnum<Lens.ReactionTypes>? { get }
    var hasCollectedByMe: Bool { get }
}

// MARK: - Post

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost: SomePublication {}

extension PublicationsQuery.Data.Publications.Item.AsPost: SomePublication {}
extension PublicationQuery.Data.Publication.AsPost: SomePublication {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost: SomePublication {}


// MARK: - Comment

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment: SomePublication {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost: SomePublication {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror: SomePublication {}

extension PublicationsQuery.Data.Publications.Item.AsComment: SomePublication {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost: SomePublication {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror: SomePublication {}

extension PublicationQuery.Data.Publication.AsComment: SomePublication {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost: SomePublication {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror: SomePublication {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment: SomePublication {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost: SomePublication {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror: SomePublication {}

// MARK: - Mirror

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror: SomePublication {}

extension PublicationsQuery.Data.Publications.Item.AsMirror: SomePublication {}
extension PublicationQuery.Data.Publication.AsMirror: SomePublication {}

#if DEBUG
extension Publication {
    public enum TestItemType {
        case explore
    }

    public enum Error: Swift.Error {
        case failedToParseJson
        case typenameNotPresent
    }

    public static func listFromJson(
        _ data: Data,
        itemType: TestItemType,
        fulfillmentHandler: (String) -> ObjectIdentifier?
    ) throws -> [Publication] {
        guard let items = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyHashable]] else {
            throw Error.failedToParseJson
        }

        return items.compactMap({ dict in
            guard let typename = dict["__typename"] as? String else {
                return nil
            }
            var dict = dict
            dict["__fulfilled"] = Set([fulfillmentHandler(typename)])
            let json = JSONValue(dict)

            do {
                let data = try JSONObject(_jsonValue: json)

                switch itemType {
                case .explore:
                    return Publication.fromItem(try ExplorePublicationsQuery.Data.ExplorePublications.Item(data: data))
                }
            } catch {
                return nil
            }
        })
    }
}
#endif
