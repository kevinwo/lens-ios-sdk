import Foundation

public protocol MediaSet {
    associatedtype T: Media

    var original: T { get }
}

// MARK: - Profile

extension ProfilesQuery.Data.Profiles.Item.Picture.AsMediaSet: MediaSet {}
extension ProfilesQuery.Data.Profiles.Item.CoverPicture.AsMediaSet: MediaSet {}

extension ProfileQuery.Data.Profile.Picture.AsMediaSet: MediaSet {}
extension ProfileQuery.Data.Profile.CoverPicture.AsMediaSet: MediaSet {}

// MARK: - Profile picture media set

// MARK: - Explore publications

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}

// MARK: - Publications

extension PublicationsQuery.Data.Publications.Item.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsComment.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}

// MARK: - Publication

extension PublicationQuery.Data.Publication.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsComment.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}

// MARK: - Profile feed

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.Picture.AsMediaSet: MediaSet {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}

// MARK: - Cover picture media set

// MARK: - Explore publications

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}

// MARK: - Publications

extension PublicationsQuery.Data.Publications.Item.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsComment.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}

// MARK: - Publication

extension PublicationQuery.Data.Publication.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsComment.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension PublicationQuery.Data.Publication.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}

// MARK: - Profile feed

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}

// MARK: - Metadata output fields

extension MetadataOutputFields.Medium: MediaSet {}
