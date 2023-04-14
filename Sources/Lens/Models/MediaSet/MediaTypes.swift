import Foundation

// MARK: - Metadata output fields

extension MetadataOutputFields.Medium.Original: Media {}

// MARK: - Explore publications

// MARK: - Profile picture media original

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Original: Media {}

// MARK: - Profile picture media medium

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Medium: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Medium: Media {}

// MARK: - Cover picture media original

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.CoverPicture.AsMediaSet.Original: Media {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.CoverPicture.AsMediaSet.Original: Media {}
