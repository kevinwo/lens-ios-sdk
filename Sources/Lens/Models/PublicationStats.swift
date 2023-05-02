import Foundation

public protocol PublicationStats {
    var totalUpvotes: Int { get }
    var totalAmountOfMirrors: Int { get }
    var totalAmountOfCollects: Int { get }
    var totalAmountOfComments: Int { get }
}

// MARK: - Post

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Stats: PublicationStats {}

extension PublicationsQuery.Data.Publications.Item.AsPost.Stats: PublicationStats {}
extension PublicationQuery.Data.Publication.AsPost.Stats: PublicationStats {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsPost.Stats: PublicationStats {}

// MARK: - Comment

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Stats: PublicationStats {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsPost.Stats: PublicationStats {}
extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.MainPost.AsMirror.Stats: PublicationStats {}

extension PublicationsQuery.Data.Publications.Item.AsComment.Stats: PublicationStats {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsPost.Stats: PublicationStats {}
extension PublicationsQuery.Data.Publications.Item.AsComment.MainPost.AsMirror.Stats: PublicationStats {}

extension PublicationQuery.Data.Publication.AsComment.Stats: PublicationStats {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsPost.Stats: PublicationStats {}
extension PublicationQuery.Data.Publication.AsComment.MainPost.AsMirror.Stats: PublicationStats {}

extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.Stats: PublicationStats {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsPost.Stats: PublicationStats {}
extension ProfileFeedQuery.Data.Feed.Item.Root.AsComment.MainPost.AsMirror.Stats: PublicationStats {}

// MARK: - Mirror

extension ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Stats: PublicationStats {}
extension PublicationsQuery.Data.Publications.Item.AsMirror.Stats: PublicationStats {}
extension PublicationQuery.Data.Publication.AsMirror.Stats: PublicationStats {}
