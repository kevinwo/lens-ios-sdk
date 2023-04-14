import Foundation

// MARK: - Post

public typealias PostProfile = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile
public typealias PostProfilePicture = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture

extension PostProfilePicture: Lens.ProfilePicture {
    public var mediaSet: MediaSet? {
        asMediaSet
    }
}

extension PostProfile: Lens.Profile {
    public var profilePicture: ProfilePicture? {
        picture
    }
}

// MARK: - Comment

public typealias CommentProfile = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile
public typealias CommentProfilePicture = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture
extension CommentProfilePicture: Lens.ProfilePicture {
    public var mediaSet: MediaSet? {
        asMediaSet
    }
}
extension CommentProfile: Lens.Profile {
    public var profilePicture: Lens.ProfilePicture? {
        picture
    }
}

// MARK: - Mirror

public typealias MirrorProfile = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile
public typealias MirrorProfilePicture = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture
extension MirrorProfilePicture: Lens.ProfilePicture {
    public var mediaSet: MediaSet? {
        asMediaSet
    }
}
extension MirrorProfile: Lens.Profile {
    public var profilePicture: Lens.ProfilePicture? {
        picture
    }
}
