import Foundation

// MARK: - Post

public typealias PostPublication = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost

extension PostPublication: AnyPublication {}

// MARK: - Comment

public typealias CommentPublication = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment

extension CommentPublication: AnyPublication {}

// MARK: - Mirror

public typealias MirrorPublication = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror

extension MirrorPublication: AnyPublication {}
