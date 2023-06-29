import Foundation
import Lens
import XCTest

extension Stubs {
    public enum Profile {
        public static func create200() throws -> CreateProfileMutation.Data {
            let data = create200ResponseJSON()
            var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
            var dictData = try XCTUnwrap(dict["data"] as? [String: AnyHashable])
            var createProfile = try XCTUnwrap(dictData["createProfile"] as? [String: AnyHashable])
            createProfile["__fulfilled"] =  Set([ObjectIdentifier(CreateProfileMutation.Data.CreateProfile.self)])
            dictData["createProfile"] = createProfile
            dict["data"] = dictData

            let json = JSONValue(dict["data"])

            return CreateProfileMutation.Data(
                _dataDict: .init(
                    data: try .init(_jsonValue: json)
                )
            )
        }

        public static func fetchAll200ResponseJSON() -> Data {
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
                        "totalCollects": 6,
                        "totalUpvotes": 234
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

        public static func fetch200ResponseJSON() -> Data {
              """
              {
                "data": {
                  "profile": {
                    "id": "0x01",
                    "name": "LensProtocol.eth 🌿",
                    "bio": "A permissionless, composable, & decentralized social graph that makes building a Web3 social platform easy.",
                    "attributes": [
                      {
                        "displayType": null,
                        "traitType": "string",
                        "key": "location",
                        "value": "Developer Garden"
                      },
                      {
                        "displayType": null,
                        "traitType": "string",
                        "key": "website",
                        "value": "https://lens.dev/"
                      },
                      {
                        "displayType": null,
                        "traitType": "string",
                        "key": "twitter",
                        "value": "lensprotocol"
                      },
                      {
                        "displayType": null,
                        "traitType": "boolean",
                        "key": "isBeta",
                        "value": "true"
                      },
                      {
                        "displayType": null,
                        "traitType": "string",
                        "key": "app",
                        "value": "Lenster"
                      }
                    ],
                    "followNftAddress": "0x5832bE646A8a7A1A7a7843efD6B8165aC06e360D",
                    "metadata": "ipfs://QmY9dUwYu67puaWBMxRKW98LPbXCznPwHUbhX5NeWnCJbX",
                    "isDefault": false,
                    "picture": {
                      "original": {
                        "url": "https://ipfs.infura.io/ipfs/QmY9dUwYu67puaWBMxRKW98LPbXCznPwHUbhX5NeWnCJbX",
                        "mimeType": null
                      },
                      "__typename": "MediaSet"
                    },
                    "handle": "lensprotocol.test",
                    "coverPicture": {
                      "original": {
                        "url": "https://ipfs.infura.io/ipfs/QmTFLSXdEQ6qsSzaXaCSNtiv6wA56qq87ytXJ182dXDQJS",
                        "mimeType": null
                      },
                      "__typename": "MediaSet"
                    },
                    "ownedBy": "0x6C77a5a88C0AE712BAeABE12FeA81532060dcBf5",
                    "dispatcher": null,
                    "stats": {
                      "totalFollowers": 2103,
                      "totalFollowing": 0,
                      "totalPosts": 2,
                      "totalComments": 0,
                      "totalMirrors": 0,
                      "totalPublications": 2,
                      "totalCollects": 1354
                    },
                    "followModule": null
                  }
                }
              }
              """.data(using: .utf8)!
        }

        public static func create200ResponseJSON() -> Data {
      """
      {
        "data": {
          "createProfile": {
            "txHash": "0xd771b9b8fd558eda20598e8a464cc9cc9e28f4bd75e823d30ee276dd590cd67e"
          }
        }
      }
      """.data(using: .utf8)!
        }
    }
}
