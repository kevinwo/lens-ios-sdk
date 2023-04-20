import Foundation

public protocol Profile {
    associatedtype PP: Picture
    associatedtype CP: Picture

    var id: String { get }
    var name: String? { get }
    var bio: String? { get }
//    var attributes: [ProfileFields.Attribute]? { get } // TODO
    var isFollowedByMe: Bool { get }
    var isFollowing: Bool { get }
    var followNftAddress: String? { get }
    var metadata: Lens.Url? { get }
    var isDefault: Bool { get }
    var handle: String { get }
    var picture: PP? { get }
    var coverPicture: CP? { get } // TODO
    var ownedBy: String { get }
//    var dispatcher: ProfileFields.Dispatcher? { get } // TODO
//    var stats: ProfileFields.Stats { get } // TODO
//    var followModule: ProfileFields.FollowModule? { get } // TODO
//    var onChainIdentity: ProfileFields.OnChainIdentity { get } // TODO
}

// MARK: - Profile

extension ProfilesQuery.Data.Profiles.Item: Profile {}

// MARK: - Explore Publications

// MARK: - Post

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile: Profile {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile: Profile {}

// MARK: - Comment

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile: Profile {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile: Profile {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile: Profile {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile: Profile {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile: Profile {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile: Profile {}

// MARK: - Mirror

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile: Profile {}
