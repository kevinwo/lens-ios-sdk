import Foundation

extension Stubs {
    enum Profile {
        static func fetchAll200ResponseJSON() -> Data {
            """
            {
              "data": {
                "profiles": {
                  "items": [
                    {
                      "id": "0x01",
                      "name": "Josh",
                      "bio": "Amazing docs",
                      "attributes": [
                        {
                          "displayType": null,
                          "traitType": null,
                          "key": "custom_field",
                          "value": "yes this is custom"
                        }
                      ],
                      "followNftAddress": null,
                      "metadata": "ipfs://QmSfyMcnh1wnJHrAWCBjZHapTS859oNSsuDFiAPPdAHgHP",
                      "isDefault": false,
                      "picture": null,
                      "handle": "josh.dev",
                      "coverPicture": null,
                      "ownedBy": "0xD020E01C0c90Ab005A01482d34B808874345FD82",
                      "dispatcher": {
                        "address": "0xEEA0C1f5ab0159dba749Dc0BAee462E5e293daaF"
                      },
                      "stats": {
                        "totalFollowers": 2,
                        "totalFollowing": 1,
                        "totalPosts": 1,
                        "totalComments": 0,
                        "totalMirrors": 0,
                        "totalPublications": 1,
                        "totalCollects": 6
                      },
                      "followModule": null
                    }
                  ],
                  "pageInfo": {
                    "prev": {
                      "offset": 0
                    },
                    "next": {
                      "offset": 1
                    },
                    "totalCount": 1
                  }
                }
              }
            }
            """.data(using: .utf8)!
        }
    }
}
