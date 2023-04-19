import Foundation

public class Post: Publication {
    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let post = item.asPost else { return nil }
        super.init(publication: post)
    }

    init?(item: ProfileFeedQuery.Data.Feed.Item.Root) {
        guard let post = item.asPost else { return nil }
        super.init(publication: post)
    }

    init?(mainPost: any SomePublication) {
        super.init(publication: mainPost)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

#if DEBUG
extension Post {
    public static var forPreview: Post {
        let dict: [String: AnyHashable] = [
            "id": "cool-id",
            "profile": [
                "id": "0x0f",
                "name": "Kevin Wo",
                "handle": "kevinwo.lens"
            ],
            "metadata": [
                "content": "Cool post content here right now"
            ],
            "createdAt": "2022-04-20T06:26:56.000Z",
            "collectModule": [
              "__typename": "RevertCollectModuleSettings",
              "type": "RevertCollectModule"
            ]
        ]
        let json = JSONValue(dict)
        return Post(item: ExplorePublicationsQuery.Data.ExplorePublications.Item(_dataDict: .init(data: try! .init(_jsonValue: json))))!
    }
}
#endif
