import Foundation

// MARK: - Media set

public typealias PostProfilePictureMediaSet = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet
public typealias CommentProfilePictureMediaSet = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet
public typealias MirrorProfilePictureMediaSet = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet

extension PostProfilePictureMediaSet: MediaSet {
    public var mediaOriginal: MediaSetOriginal {
        original
    }
}

extension CommentProfilePictureMediaSet: MediaSet {
    public var mediaOriginal: MediaSetOriginal {
        original
    }
}

extension MirrorProfilePictureMediaSet: MediaSet {
    public var mediaOriginal: MediaSetOriginal {
        original
    }
}

// MARK: - Media set original

public typealias PostProfilePictureMediaSetOriginal = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Original
public typealias CommentProfilePictureMediaSetOriginal = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Original
public typealias MirrorProfilePictureMediaSetOriginal = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Original

extension PostProfilePictureMediaSetOriginal: MediaSetOriginal {}
extension CommentProfilePictureMediaSetOriginal: MediaSetOriginal {}
extension MirrorProfilePictureMediaSetOriginal: MediaSetOriginal {}
