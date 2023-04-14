import Foundation

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
        return Comment(item: .init(_dataDict: .init(data: try! .init(_jsonValue: json))))!
    }
}
