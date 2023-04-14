import Foundation

// MARK: - Post

typealias PostProfile = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile
typealias PostProfilePicture = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture

extension PostProfilePicture: AnyProfilePicture {
    var mediaSet: (any AnyMediaSet)? {
        asMediaSet
    }
}

extension PostProfile: AnyProfile {
    var profilePicture: AnyProfilePicture? {
        picture
    }
}

// MARK: - Comment

typealias CommentProfile = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile
typealias CommentProfilePicture = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture
extension CommentProfilePicture: AnyProfilePicture {
    var mediaSet: (any AnyMediaSet)? {
        asMediaSet
    }
}
extension CommentProfile: AnyProfile {
    var profilePicture: AnyProfilePicture? {
        picture
    }
}

// MARK: - Mirror

typealias MirrorProfile = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile
typealias MirrorProfilePicture = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture
extension MirrorProfilePicture: AnyProfilePicture {
    var mediaSet: (any AnyMediaSet)? {
        asMediaSet
    }
}
extension MirrorProfile: AnyProfile {
    var profilePicture: AnyProfilePicture? {
        picture
    }
}
