import Foundation

// MARK: - Post

public typealias PostMetadata = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Metadata

extension PostMetadata: AnyMetadata {
    var _media: [any AnyMediaSet] {
        media
    }
}

// MARK: - Comment

public typealias CommentMetadata = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Metadata

extension CommentMetadata: AnyMetadata {
    var _media: [any AnyMediaSet] {
        media
    }
}

// MARK: - Mirror

public typealias MirrorMetadata = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Metadata

extension MirrorMetadata: AnyMetadata {
    var _media: [any AnyMediaSet] {
        media
    }
}
