import Foundation

public protocol MediaSet {
    associatedtype T: Media

    var original: T { get }
}

// MARK: - Explore publications

// MARK: - Profile picture media set

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet: MediaSet {}

// MARK: - Cover picture media set

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.CoverPicture.AsMediaSet: MediaSet {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.CoverPicture.AsMediaSet: MediaSet {}

// MARK: - Metadata output fields

extension MetadataOutputFields.Medium: MediaSet {}