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

extension ProfileQuery.Data.Profile.Picture.AsMediaSet.Original: Media {}
extension ProfileQuery.Data.Profile.Picture.AsMediaSet.Medium: Media {}
extension ProfileQuery.Data.Profile.Picture.AsMediaSet.Small: Media {}
extension ProfileQuery.Data.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ProfileQuery.Data.Profile.CoverPicture.AsMediaSet.Medium: Media {}
extension ProfileQuery.Data.Profile.CoverPicture.AsMediaSet.Small: Media {}

// MARK: - Profile picture media original

// MARK: - Explore publications

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}

// MARK: - Publications

extension PublicationsQuery.Data.Publications.Item.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}

// MARK: - Publication

extension PublicationQuery.Data.Publication.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsComment.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}

// MARK: - Profile feed

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.Picture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}

// MARK: - Profile picture media medium

// MARK: - Explore publications

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}

// MARK: - Publications

extension PublicationsQuery.Data.Publications.Item.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}

extension PublicationsQuery.Data.Publications.Item.AsPost.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Profile.Picture.AsMediaSet.Small: Media {}

// MARK: - Publication

extension PublicationQuery.Data.Publication.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationQuery.Data.Publication.AsComment.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}
extension PublicationQuery.Data.Publication.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}

extension PublicationQuery.Data.Publication.AsPost.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationQuery.Data.Publication.AsComment.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Small: Media {}
extension PublicationQuery.Data.Publication.AsMirror.Profile.Picture.AsMediaSet.Small: Media {}

// MARK: - Profile feed

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.Picture.AsMediaSet.Medium: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}

// MARK: - Cover picture media original

// MARK: - Explore publications

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}

// MARK: - Publications

extension PublicationsQuery.Data.Publications.Item.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}

// MARK: - Publication

extension PublicationQuery.Data.Publication.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsComment.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension PublicationQuery.Data.Publication.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}

// MARK: - Profile feed

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}
