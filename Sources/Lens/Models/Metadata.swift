import Foundation

public protocol Metadata {
    associatedtype MS: MediaSet

    var name: String? { get }
    var description: String? { get }
    var content: String? { get }
    var media: [MS] { get }
}

// MARK: - Post

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Metadata: Metadata {}

// MARK: - Comment

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Metadata: Metadata {}

// MARK: - Mirror

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Metadata: Metadata {}
