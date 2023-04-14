import Foundation

public typealias ExplorePost = ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost
extension ExplorePost: Lens.Post {
    public var authorProfile: Lens.Profile {
        profile
    }
}

public protocol Post: Publication {

}
