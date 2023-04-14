import Foundation

// MARK: - Media set

typealias PostProfilePictureMediaSet = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet
typealias CommentProfilePictureMediaSet = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet
typealias MirrorProfilePictureMediaSet = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet

extension PostProfilePictureMediaSet: AnyMediaSet {}
extension CommentProfilePictureMediaSet: AnyMediaSet {}
extension MirrorProfilePictureMediaSet: AnyMediaSet {}

// MARK: - Media set output fields

extension MetadataOutputFields.Medium: AnyMediaSet {}
extension MetadataOutputFields.Medium.Original: AnyMedia {}

// MARK: - Media set original

public typealias PostProfilePictureMediaSetOriginal = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Original
public typealias CommentProfilePictureMediaSetOriginal = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Original
public typealias MirrorProfilePictureMediaSetOriginal = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Original

extension PostProfilePictureMediaSetOriginal: AnyMedia {}
extension CommentProfilePictureMediaSetOriginal: AnyMedia {}
extension MirrorProfilePictureMediaSetOriginal: AnyMedia {}

// MARK: - Media set medium

typealias PostProfilePictureMediaSetMedium = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Medium
typealias CommentProfilePictureMediaSetMedium = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.Profile.Picture.AsMediaSet.Medium
typealias MirrorProfilePictureMediaSetMedium = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.Profile.Picture.AsMediaSet.Medium

extension PostProfilePictureMediaSetMedium: AnyMedia {}
extension CommentProfilePictureMediaSetMedium: AnyMedia {}
extension MirrorProfilePictureMediaSetMedium: AnyMedia {}
