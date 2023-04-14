import Foundation

public protocol Profile {
    var id: String { get }
    var name: String? { get }
    var bio: String? { get }
//    var attributes: [ProfileFields.Attribute]? { get } // TODO
    var isFollowedByMe: Bool { get }
    var isFollowing: Bool { get }
    var followNftAddress: String? { get }
    var metadata: Lens.Url? { get }
    var isDefault: Bool { get }
    var handle: String { get }
    var profilePicture: ProfilePicture? { get }
//    var coverPicture: CoverPicture? { get } // TODO
    var ownedBy: String { get }
//    var dispatcher: ProfileFields.Dispatcher? { get } // TODO
//    var stats: ProfileFields.Stats { get } // TODO
//    var followModule: ProfileFields.FollowModule? { get } // TODO
//    var onChainIdentity: ProfileFields.OnChainIdentity { get } // TODO
}

public protocol ProfilePicture {
    var mediaSet: MediaSet? { get }
}
