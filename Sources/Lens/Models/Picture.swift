import Foundation

public protocol Picture {
    associatedtype MS: MediaSet

    var asMediaSet: MS? { get }
}

// MARK: - Profile

extension ProfilesQuery.Data.Profiles.Item.Picture: Picture {}
extension ProfilesQuery.Data.Profiles.Item.CoverPicture: Picture {}

extension ProfileQuery.Data.Profile.Picture: Picture {}
extension ProfileQuery.Data.Profile.CoverPicture: Picture {}

// MARK: - Explore publications

// MARK: - Post

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture: Picture {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.CoverPicture: Picture {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.Picture: Picture {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.CoverPicture: Picture {}

// MARK: - Comment

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture: Picture {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.Picture: Picture {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.Picture: Picture {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.CoverPicture: Picture {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.CoverPicture: Picture {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.CoverPicture: Picture {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.Picture: Picture {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.Picture: Picture {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.Picture: Picture {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.CoverPicture: Picture {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.CoverPicture: Picture {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.CoverPicture: Picture {}

// MARK: - Mirror

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture: Picture {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.CoverPicture: Picture {}
