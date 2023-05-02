import Foundation

public class Comment: Publication {
    public let mainPost: Publication?

    init?(item: ExplorePublicationsQuery.Data.ExplorePublications.Item) {
        guard let comment = item.asComment else { return nil }
        self.mainPost = {
            if let post = comment.mainPost.asPost {
                return Post(mainPost: post)
            } else if let mirror = comment.mainPost.asMirror {
                return Mirror(mainPost: mirror)
            } else {
                return nil
            }
        }()

        super.init(publication: comment)
    }

    init?(item: ProfileFeedQuery.Data.Feed.Item) {
        guard let comment = item.root.asComment else { return nil }
        self.mainPost = {
            if let post = comment.mainPost.asPost {
                return Post(mainPost: post)
            } else {
                return nil
            }
        }()

        super.init(publication: comment)
    }

    init?(item: PublicationsQuery.Data.Publications.Item) {
        guard let comment = item.asComment else { return nil }
        self.mainPost = {
            if let post = comment.mainPost.asPost {
                return Post(mainPost: post)
            } else if let mirror = comment.mainPost.asMirror {
                return Mirror(mainPost: mirror)
            } else {
                return nil
            }
        }()

        super.init(publication: comment)
    }

    init?(item: PublicationQuery.Data.Publication) {
        guard let comment = item.asComment else { return nil }
        self.mainPost = {
            if let post = comment.mainPost.asPost {
                return Post(mainPost: post)
            } else if let mirror = comment.mainPost.asMirror {
                return Mirror(mainPost: mirror)
            } else {
                return nil
            }
        }()

        super.init(publication: comment)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

#if DEBUG
extension Comment {
    public static var forPreview: Comment {
        let dict: [String: AnyHashable] = [
            "id": "cool-id",
            "profile": [
                "id": "0x0f",
                "name": "Kevin Wo",
                "handle": "kevinwo.lens"
            ],
            "metadata": [
                "content": "Cool comment here right now"
            ],
            "createdAt": "2022-04-20T06:26:56.000Z",
            "collectModule": [
              "__typename": "RevertCollectModuleSettings",
              "type": "RevertCollectModule"
            ]
        ]
        let json = JSONValue(dict)
        return Comment(item: ExplorePublicationsQuery.Data.ExplorePublications.Item(_dataDict: .init(data: try! .init(_jsonValue: json))))!
    }
}
#endif
