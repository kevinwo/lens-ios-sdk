import Foundation

public protocol Media {
    var url: String { get }
    var mimeType: String? { get }
}

// MARK: - Metadata output fields

extension MetadataOutputFields.Medium.Original: Media {}

// MARK: - Profile

extension ProfilesQuery.Data.Profiles.Item.Picture.AsMediaSet.Original: Media {}
extension ProfilesQuery.Data.Profiles.Item.Picture.AsMediaSet.Medium: Media {}
extension ProfilesQuery.Data.Profiles.Item.Picture.AsMediaSet.Small: Media {}
extension ProfilesQuery.Data.Profiles.Item.CoverPicture.AsMediaSet.Original: Media {}
extension ProfilesQuery.Data.Profiles.Item.CoverPicture.AsMediaSet.Medium: Media {}
extension ProfilesQuery.Data.Profiles.Item.CoverPicture.AsMediaSet.Small: Media {}

// MARK: - Explore publications

// MARK: - Profile picture media original

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.Picture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}

// MARK: - Profile picture media medium

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.Picture.AsMediaSet.Medium: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}

// MARK: - Cover picture media original

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}
