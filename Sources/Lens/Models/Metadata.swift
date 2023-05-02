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

extension PublicationsQuery.Data.Publications.Item.AsPost.Metadata: Metadata {}
extension PublicationQuery.Data.Publication.AsPost.Metadata: Metadata {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Metadata: Metadata {}

// MARK: - Comment

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Metadata: Metadata {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Metadata: Metadata {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Metadata: Metadata {}

extension PublicationsQuery.Data.Publications.Item.AsComment.Metadata: Metadata {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Metadata: Metadata {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Metadata: Metadata {}

extension PublicationQuery.Data.Publication.AsComment.Metadata: Metadata {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Metadata: Metadata {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Metadata: Metadata {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Metadata: Metadata {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Metadata: Metadata {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Metadata: Metadata {}

// MARK: - Mirror

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Metadata: Metadata {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Metadata: Metadata {}
extension PublicationQuery.Data.Publication.AsMirror.Metadata: Metadata {}
