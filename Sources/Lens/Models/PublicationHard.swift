//import Foundation
//
//open class Publication: Codable {
//    public let id: String
//    public let profile: Profile
//
//    init(post: ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost) {
//        self.id = post.id
//        self.profile = Profile(profile: post.profile)
//    }
//
//    init(comment: ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment) {
//        self.id = comment.id
//        self.profile = Profile(profile: comment.profile)
//    }
//
//    init(mirror: ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror) {
//        self.id = mirror.id
//        self.profile = Profile(profile: mirror.profile)
//    }
//
//    static func fromItem(_ item: ExplorePublicationsQuery.Data.ExplorePublications.Item) -> Publication? {
//        switch item.__typename {
//        case "Post": return Post(item: item)
//        case "Comment": return Comment(item: item)
//        case "Mirror": return Mirror(item: item)
//        default: return nil
//        }
//    }
//}
//
//public class Post: Publication {
//    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
//        guard let post = item.asPost else { return nil }
//        super.init(post: post)
//    }
//
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
//}
//
//public class Comment: Publication {
//    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
//        guard let comment = item.asComment else { return nil }
//        super.init(comment: comment)
//    }
//
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
//}
//
//public class Mirror: Publication {
//    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
//        guard let mirror = item.asMirror else { return nil }
//        super.init(mirror: mirror)
//    }
//
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
//}
//
//
////import Foundation
////
////open class Publication: Codable, Identifiable {
////    public let id: String
////
////    init?(post: ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost?) {
////        self.id = post.id
////    }
////
////    static func fromItem(_ item: ExplorePublicationsQuery.Data.ExplorePublications.Item) -> Publication? {
////        switch item.__typename {
////        case "Post":
////            return Publication.init(post: item.asPost)
////        case "Comment":
////            return Publication.init(post: item.asComment)
////        case "Mirror":
////            return Publication.init(post: item.asMirror)
////        default:
////            return nil
////        }
////    }
////}
