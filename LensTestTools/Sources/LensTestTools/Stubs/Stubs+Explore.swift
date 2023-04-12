import Foundation

public extension Stubs {
    enum Explore {
        public static func publicationsItemsJSON() -> Data {
            """
            {
              "items": [{
                  "__typename": "Post",
                  "id": "0x03b0-0x01",
                  "profile": {
                    "id": "0x03b0",
                    "name": null,
                    "bio": null,
                    "attributes": [],
                    "isFollowedByMe": false,
                    "isFollowing": false,
                    "followNftAddress": null,
                    "metadata": null,
                    "isDefault": true,
                    "handle": "jojay",
                    "picture": {
                      "original": {
                        "url": "https://ipfs.infura.io/ipfs/QmcKD5Zxic7JAum22jKRnT3ENY4tCCp7qQSPJTCLkHAApm",
                        "width": null,
                        "height": null,
                        "mimeType": null
                      },
                      "small": null,
                      "medium": null
                    },
                    "coverPicture": null,
                    "ownedBy": "0x0c0E611A29b339D8c1048F2Edf9d4160A5fb8F22",
                    "dispatcher": null,
                    "stats": {
                      "totalFollowers": 1,
                      "totalFollowing": 4,
                      "totalPosts": 1,
                      "totalComments": 0,
                      "totalMirrors": 0,
                      "totalPublications": 1,
                      "totalCollects": 0
                    },
                    "followModule": {
                      "type": "FeeFollowModule",
                      "amount": {
                        "asset": {
                          "name": "Wrapped Matic",
                          "symbol": "WMATIC",
                          "decimals": 18,
                          "address": "0x9c3C9283D3e44854697Cd22D3Faa240Cfb032889"
                        },
                        "value": "10.0"
                      },
                      "recipient": "0x0c0E611A29b339D8c1048F2Edf9d4160A5fb8F22"
                    }
                  },
                  "stats": {
                    "totalAmountOfMirrors": 0,
                    "totalAmountOfCollects": 0,
                    "totalAmountOfComments": 3
                  },
                  "metadata": {
                    "name": "Post by @jojay",
                    "description": "Hello Josh :)",
                    "content": "Hello Josh :)",
                    "media": [],
                    "attributes": [{
                      "displayType": null,
                      "traitType": "type",
                      "value": "post"
                    }]
                  },
                  "createdAt": "2022-04-16T08:33:25.000Z",
                  "collectModule": {
                    "__typename": "RevertCollectModuleSettings",
                    "type": "RevertCollectModule"
                  },
                  "referenceModule": null,
                  "appId": "Lenster",
                  "hidden": false,
                  "reaction": null,
                  "mirrors": [],
                  "hasCollectedByMe": false
                },
                {
                  "__typename": "Post",
                  "id": "0x0f-0xa0",
                  "profile": {
                    "id": "0x0f",
                    "name": null,
                    "bio": null,
                    "attributes": [],
                    "followNftAddress": "0x8A8bd1E37b099aE3386D13947b6a90d97675e9a1",
                    "metadata": null,
                    "isDefault": true,
                    "handle": "wagmi.lens",
                    "picture": {
                      "original": {
                        "url": "https://ipfs.infura.io/ipfs/Qma8mXoeorvPqodDazf7xqARoFD394s1njkze7q1X4CK8U",
                        "width": null,
                        "height": null,
                        "mimeType": null
                      },
                      "small": null,
                      "medium": null
                    },
                    "coverPicture": null,
                    "ownedBy": "0x3A5bd1E37b099aE3386D13947b6a90d97675e5e3",
                    "dispatcher": null,
                    "stats": {
                      "totalFollowers": 111,
                      "totalFollowing": 15,
                      "totalPosts": 89,
                      "totalComments": 64,
                      "totalMirrors": 15,
                      "totalPublications": 168,
                      "totalCollects": 215
                    },
                    "followModule": null
                  },
                  "stats": {
                    "totalAmountOfMirrors": 0,
                    "totalAmountOfCollects": 0,
                    "totalAmountOfComments": 6
                  },
                  "metadata": {
                    "name": "Post by @yoginth",
                    "description": "Testing",
                    "content": "Testing",
                    "media": [],
                    "attributes": [{
                      "displayType": null,
                      "traitType": "string",
                      "value": "post"
                    }]
                  },
                  "createdAt": "2022-04-20T06:26:56.000Z",
                  "collectModule": {
                    "__typename": "RevertCollectModuleSettings",
                    "type": "RevertCollectModule"
                  },
                  "referenceModule": null,
                  "appId": "Lenster",
                  "hidden": false,
                  "reaction": null,
                  "mirrors": [],
                  "hasCollectedByMe": false
                }
              ],
              "pageInfo": {
                "prev": {
                  "timestamp": 1649942608500,
                  "offset": 0,
                  "randomizer": 5
                },
                "next": {
                  "timestamp": 1649942608500,
                  "offset": 10,
                  "randomizer": 5
                },
                "totalCount": 2
              }
            }
            """.data(using: .utf8)!
        }
    }
}
