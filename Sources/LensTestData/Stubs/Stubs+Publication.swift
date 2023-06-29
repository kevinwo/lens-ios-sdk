import Foundation
import Lens
import XCTest

extension Stubs {
    public enum Publication {
        public static func fetchAll200ResponseJSON() -> Data {
            """
            {
              "data": {
                "publications": {
                  "items": [
                    {
                      "__typename": "Post",
                      "id": "0x01-0x01",
                      "profile": {
                        "id": "0x01",
                        "name": null,
                        "bio": null,
                        "attributes": [
                          {
                            "displayType": null,
                            "traitType": null,
                            "key": "custom_field",
                            "value": "yes this is custom"
                          }
                        ],
                        "isFollowedByMe": false,
                                    "isFollowing": false,
                        "followNftAddress": null,
                        "metadata": "ipfs://QmSfyMcnh1wnJHrAWCBjZHapTS859oNSsuDFiAPPdAHgHP",
                        "isDefault": false,
                        "handle": "hey",
                        "picture": null,
                        "coverPicture": null,
                        "ownedBy": "0xD020E01C0c90Ab005A01482d34B808874345FD82",
                        "dispatcher": null,
                        "stats": {
                          "totalFollowers": 2,
                          "totalFollowing": 1,
                          "totalPosts": 1,
                          "totalComments": 0,
                          "totalMirrors": 0,
                          "totalPublications": 1,
                          "totalCollects": 0
                        },
                        "followModule": null
                      },
                      "stats": {
                        "totalAmountOfMirrors": 0,
                        "totalAmountOfCollects": 0,
                        "totalAmountOfComments": 0
                      },
                      "metadata": {
                        "name": "",
                        "description": "",
                        "content": "Hello",
                        "media": null,
                        "attributes": []
                      },
                      "createdAt": "2022-02-10T09:50:46.000Z",
                      "collectModule": {
                        "__typename": "FreeCollectModuleSettings",
                        "type": "FreeCollectModule"
                      },
                      "referenceModule": null,
                      "appId": null,
                      "hidden": false,
                      "reaction": null,
                      "mirrors": [],
                                "hasCollectedByMe": false
                    }
                  ],
                  "pageInfo": {
                    "prev": "cursor",
                    "next": "cursor",
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
                "publication": {
                  "__typename": "Post",
                  "id": "0x01-0x01",
                  "profile": {
                    "id": "0x01",
                    "name": null,
                    "bio": null,
                    "attributes": [
                      {
                        "displayType": null,
                        "traitType": null,
                        "key": "custom_field",
                        "value": "yes this is custom"
                      }
                     ],
                    "isFollowedByMe": false,
                            "isFollowing": false,
                    "followNftAddress": null,
                    "metadata": "ipfs://QmSfyMcnh1wnJHrAWCBjZHapTS859oNSsuDFiAPPdAHgHP",
                    "isDefault": false,
                    "handle": "hey",
                    "picture": null,
                    "coverPicture": null,
                    "ownedBy": "0xD020E01C0c90Ab005A01482d34B808874345FD82",
                    "dispatcher": null,
                    "stats": {
                      "totalFollowers": 2,
                      "totalFollowing": 1,
                      "totalPosts": 1,
                      "totalComments": 0,
                      "totalMirrors": 0,
                      "totalPublications": 1,
                      "totalCollects": 0
                    },
                    "followModule": null
                  },
                  "stats": {
                    "totalAmountOfMirrors": 0,
                    "totalAmountOfCollects": 0,
                    "totalAmountOfComments": 0
                  },
                  "metadata": {
                    "name": "",
                    "description": "",
                    "content": "Hello",
                    "media": null,
                    "attributes": []
                  },
                  "createdAt": "2022-02-10T09:50:46.000Z",
                  "collectModule": {
                    "__typename": "FreeCollectModuleSettings",
                    "type": "FreeCollectModule"
                  },
                  "referenceModule": null,
                  "appId": null,
                  "hidden": false,
                  "reaction": null,
                  "mirrors": [],
                        "hasCollectedByMe": false
                }
              }
            }
            """.data(using: .utf8)!
        }

        public static func createCollectTypedData200ResponseJSON() -> Data {
            """
            {
              "data": {
                "result": {
                  "id": "32d94413-90e2-40a2-aa73-0a55c30a9839",
                  "expiresAt": "2022-02-24T11:34:59.000Z",
                  "typedData": {
                    "types": {
                      "CollectWithSig": [
                        {
                          "name": "profileId",
                          "type": "uint256"
                        },
                        {
                          "name": "pubId",
                          "type": "uint256"
                        },
                        {
                          "name": "data",
                          "type": "bytes"
                        },
                        {
                          "name": "nonce",
                          "type": "uint256"
                        },
                        {
                          "name": "deadline",
                          "type": "uint256"
                        }
                      ]
                    },
                    "domain": {
                      "name": "Lens Protocol Profile",
                      "chainId": 80001,
                      "version": "1",
                      "verifyingContract": "0x23C1ce2b0865406955Da08F1D31c13fcc3f72A3a"
                    },
                    "value": {
                      "nonce": 0,
                      "deadline": 1645702499,
                      "profileId": "0x1d",
                      "pubId": "0x01",
                      "data": "0x"
                    }
                  }
                }
              }
            }
            """.data(using: .utf8)!
        }

        public static func fetchAllPublications() throws -> PublicationsQuery.Data {
            let data = fetchAll200ResponseJSON()
            var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
            var dictData = try XCTUnwrap(dict["data"] as? [String: AnyHashable])
            var publications = try XCTUnwrap(dictData["publications"] as? [String: AnyHashable])
            let items = try XCTUnwrap(publications["items"] as? [[String: AnyHashable]])
            publications["items"] = try items.map({ dict in
                let typename = try XCTUnwrap(dict["__typename"] as? String)
                var dict = dict
                dict["__fulfilled"] = Set([fetchAllFulfillmentObjectIdentifier(for: typename)])
                return dict
            })
            dictData["publications"] = publications
            dict["data"] = dictData

            let json = JSONValue(dict["data"])

            return PublicationsQuery.Data(
                _dataDict: .init(
                    data: try .init(_jsonValue: json)
                )
            )
        }

        public static func fetchPublication() throws -> PublicationQuery.Data {
            let data = fetch200ResponseJSON()
            var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
            var dictData = try XCTUnwrap(dict["data"] as? [String: AnyHashable])
            var publication = try XCTUnwrap(dictData["publication"] as? [String: AnyHashable])

            let typename = try XCTUnwrap(publication["__typename"] as? String)
            publication["__fulfilled"] = Set([fetchFulfillmentObjectIdentifier(for: typename)])

            dictData["publication"] = publication
            dict["data"] = dictData

            let json = JSONValue(dict["data"])

            return PublicationQuery.Data(
                _dataDict: .init(
                    data: try .init(_jsonValue: json)
                )
            )
        }

        public static func createCollectTypedData() throws -> CreateCollectTypedDataMutation.Data {
            let data = createCollectTypedData200ResponseJSON()
            var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
            var dictData = try XCTUnwrap(dict["data"] as? [String: AnyHashable])
            var result = try XCTUnwrap(dictData["result"] as? [String: AnyHashable])
            result["__fulfilled"] = Set([ObjectIdentifier(CreateCollectTypedDataMutation.Data.Result.self)])

            dictData["result"] = result
            dict["data"] = dictData

            let json = JSONValue(dict["data"])

            return CreateCollectTypedDataMutation.Data(
                _dataDict: .init(
                    data: try .init(_jsonValue: json)
                )
            )
        }

        public static func testPost() throws -> PublicationsQuery.Data.Publications.Item {
            let data = Stubs.Publication.testPostData
            return try item(for: data)
        }

        public static func testComment() throws -> PublicationsQuery.Data.Publications.Item {
            let data = Stubs.Publication.testCommentData
            return try item(for: data)
        }

        public static var testPostData: Data {
            """
            {
                "__typename": "Post",
                "id": "0x7392-0x0134",
                "profile": {
                    "__typename": "Profile",
                    "id": "0x7392",
                    "name": null,
                    "bio": null,
                    "attributes": [],
                    "isFollowedByMe": false,
                    "isFollowing": false,
                    "followNftAddress": "0x4670d67F327B24B9B729788D9b2b72Da9Cb1D4ED",
                    "metadata": null,
                    "isDefault": false,
                    "handle": "qatest1679487769092.test",
                    "picture": {
                        "__typename": "MediaSet",
                        "original": {
                            "__typename": "Media",
                            "url": "https://test.com",
                            "width": null,
                            "height": null,
                            "mimeType": null
                        },
                        "small": null,
                        "medium": null
                    },
                    "coverPicture": null,
                    "ownedBy": "0x7d32430E9f44B4Bc17C8d86c005d46C7284cfE14",
                    "dispatcher": {
                        "__typename": "Dispatcher",
                        "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F",
                        "canUseRelay": true
                    },
                    "stats": {
                        "__typename": "ProfileStats",
                        "totalFollowers": 2,
                        "totalFollowing": 0,
                        "totalPosts": 416,
                        "totalComments": 0,
                        "totalMirrors": 0,
                        "totalPublications": 416,
                        "totalCollects": 79,
                        "totalUpvotes": 234
                    },
                    "followModule": null,
                    "onChainIdentity": {
                        "__typename": "OnChainIdentity",
                        "ens": {
                            "__typename": "EnsOnChainIdentity",
                            "name": null
                        },
                        "proofOfHumanity": false,
                        "sybilDotOrg": {
                            "__typename": "SybilDotOrgIdentity",
                            "verified": false,
                            "source": {
                                "__typename": "SybilDotOrgIdentitySource",
                                "twitter": {
                                    "__typename": "SybilDotOrgTwitterIdentity",
                                    "handle": null
                                }
                            }
                        },
                        "worldcoin": {
                            "__typename": "WorldcoinIdentity",
                            "isHuman": false
                        }
                    }
                },
                "stats": {
                    "__typename": "PublicationStats",
                    "totalUpvotes": 23,
                    "totalAmountOfMirrors": 0,
                    "totalAmountOfCollects": 0,
                    "totalAmountOfComments": 2
                },
                "metadata": {
                    "__typename": "MetadataOutput",
                    "name": "Video Post Aave Testing",
                    "description": "Video Post created for testing purposes",
                    "content": "Content related to Video Publication for testing",
                    "media": [{
                        "__typename": "MediaSet",
                        "original": {
                            "__typename": "Media",
                            "url": "https://static-lens-staging-qa.s3.eu-west-1.amazonaws.com/video_post.mp4",
                            "width": null,
                            "height": null,
                            "mimeType": "video/webm"
                        },
                        "small": null,
                        "medium": null
                    }],
                    "attributes": [],
                    "encryptionParams": null
                },
                "createdAt": "2023-04-12T21:39:23.000Z",
                "collectModule": {
                    "__typename": "TimedFeeCollectModuleSettings",
                    "type": "TimedFeeCollectModule",
                    "amount": {
                        "__typename": "ModuleFeeAmount",
                        "asset": {
                            "__typename": "Erc20",
                            "name": "DAI",
                            "symbol": "DAI",
                            "decimals": 18,
                            "address": "0x001B3B4d0F3714Ca98ba10F6042DaEbF0B1B7b6F"
                        },
                        "value": "0.1"
                    },
                    "recipient": "0x809BBaD32F441214A38D379d112C64618E41cB91",
                    "referralFee": 0,
                    "endTimestamp": "2023-04-13T21:39:23.000Z"
                },
                "referenceModule": null,
                "appId": "test_api_e2e",
                "hidden": false,
                "reaction": null,
                "mirrors": [],
                "hasCollectedByMe": false,
                "isGated": false
            }
            """.data(using: .utf8)!
        }

        public static var testCommentData: Data {
            """
            {
                "__typename": "Comment",
                "id": "0x689c-0x016d",
                "profile": {
                    "__typename": "Profile",
                    "id": "0x689c",
                    "name": null,
                    "bio": null,
                    "attributes": [],
                    "isFollowedByMe": false,
                    "isFollowing": false,
                    "followNftAddress": "0xE54D2253Dde9901A60B1AE8DE58dE7ad3cd695B4",
                    "metadata": null,
                    "isDefault": false,
                    "handle": "qatest46230.test",
                    "picture": {
                        "__typename": "MediaSet",
                        "original": {
                            "__typename": "Media",
                            "url": "https://test.com",
                            "width": null,
                            "height": null,
                            "mimeType": null
                        },
                        "small": null,
                        "medium": null
                    },
                    "coverPicture": null,
                    "ownedBy": "0xC7bEEA2D68D6FC7e175089F98eAC2FEb3aD7A95d",
                    "dispatcher": {
                        "__typename": "Dispatcher",
                        "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F",
                        "canUseRelay": true
                    },
                    "stats": {
                        "__typename": "ProfileStats",
                        "totalFollowers": 3,
                        "totalFollowing": 0,
                        "totalPosts": 0,
                        "totalComments": 375,
                        "totalMirrors": 0,
                        "totalPublications": 375,
                        "totalCollects": 0,
                        "totalUpvotes": 234
                    },
                    "followModule": null,
                    "onChainIdentity": {
                        "__typename": "OnChainIdentity",
                        "ens": {
                            "__typename": "EnsOnChainIdentity",
                            "name": null
                        },
                        "proofOfHumanity": false,
                        "sybilDotOrg": {
                            "__typename": "SybilDotOrgIdentity",
                            "verified": false,
                            "source": {
                                "__typename": "SybilDotOrgIdentitySource",
                                "twitter": {
                                    "__typename": "SybilDotOrgTwitterIdentity",
                                    "handle": null
                                }
                            }
                        },
                        "worldcoin": {
                            "__typename": "WorldcoinIdentity",
                            "isHuman": false
                        }
                    }
                },
                "stats": {
                    "__typename": "PublicationStats",
                    "totalUpvotes": 23,
                    "totalAmountOfMirrors": 0,
                    "totalAmountOfCollects": 0,
                    "totalAmountOfComments": 1
                },
                "metadata": {
                    "__typename": "MetadataOutput",
                    "name": "Comment Lens Test Image",
                    "description": "Image Comment created for testing purposes",
                    "content": "Content related to comment adding an image",
                    "media": [{
                        "__typename": "MediaSet",
                        "original": {
                            "__typename": "Media",
                            "url": "https://openseauserdata.com/files/a2f72df028ba836c845e0740119f782f.svg",
                            "width": null,
                            "height": null,
                            "mimeType": "image/png"
                        },
                        "small": null,
                        "medium": null
                    }],
                    "attributes": [],
                    "encryptionParams": null
                },
                "createdAt": "2023-04-12T21:43:27.000Z",
                "collectModule": {
                    "__typename": "FreeCollectModuleSettings",
                    "type": "FreeCollectModule",
                    "followerOnly": false,
                    "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                },
                "referenceModule": null,
                "appId": "test_api_e2e",
                "hidden": false,
                "reaction": null,
                "mirrors": [],
                "hasCollectedByMe": false,
                "isGated": false,
                "mainPost": {
                    "__typename": "Post",
                    "id": "0x7392-0x0134",
                    "profile": {
                        "__typename": "Profile",
                        "id": "0x7392",
                        "name": null,
                        "bio": null,
                        "attributes": [],
                        "isFollowedByMe": false,
                        "isFollowing": false,
                        "followNftAddress": "0x4670d67F327B24B9B729788D9b2b72Da9Cb1D4ED",
                        "metadata": null,
                        "isDefault": false,
                        "handle": "qatest1679487769092.test",
                        "picture": {
                            "__typename": "MediaSet",
                            "original": {
                                "__typename": "Media",
                                "url": "https://test.com",
                                "width": null,
                                "height": null,
                                "mimeType": null
                            },
                            "small": null,
                            "medium": null
                        },
                        "coverPicture": null,
                        "ownedBy": "0x7d32430E9f44B4Bc17C8d86c005d46C7284cfE14",
                        "dispatcher": {
                            "__typename": "Dispatcher",
                            "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F",
                            "canUseRelay": true
                        },
                        "stats": {
                            "__typename": "ProfileStats",
                            "totalFollowers": 2,
                            "totalFollowing": 0,
                            "totalPosts": 416,
                            "totalComments": 0,
                            "totalMirrors": 0,
                            "totalPublications": 416,
                            "totalCollects": 79,
                            "totalUpvotes": 234
                        },
                        "followModule": null,
                        "onChainIdentity": {
                            "__typename": "OnChainIdentity",
                            "ens": {
                                "__typename": "EnsOnChainIdentity",
                                "name": null
                            },
                            "proofOfHumanity": false,
                            "sybilDotOrg": {
                                "__typename": "SybilDotOrgIdentity",
                                "verified": false,
                                "source": {
                                    "__typename": "SybilDotOrgIdentitySource",
                                    "twitter": {
                                        "__typename": "SybilDotOrgTwitterIdentity",
                                        "handle": null
                                    }
                                }
                            },
                            "worldcoin": {
                                "__typename": "WorldcoinIdentity",
                                "isHuman": false
                            }
                        }
                    },
                    "stats": {
                        "__typename": "PublicationStats",
                        "totalUpvotes": 23,
                        "totalAmountOfMirrors": 0,
                        "totalAmountOfCollects": 0,
                        "totalAmountOfComments": 2
                    },
                    "metadata": {
                        "__typename": "MetadataOutput",
                        "name": "Video Post Aave Testing",
                        "description": "Video Post created for testing purposes",
                        "content": "Content related to Video Publication for testing",
                        "media": [{
                            "__typename": "MediaSet",
                            "original": {
                                "__typename": "Media",
                                "url": "https://static-lens-staging-qa.s3.eu-west-1.amazonaws.com/video_post.mp4",
                                "width": null,
                                "height": null,
                                "mimeType": "video/webm"
                            },
                            "small": null,
                            "medium": null
                        }],
                        "attributes": [],
                        "encryptionParams": null
                    },
                    "createdAt": "2023-04-12T21:39:23.000Z",
                    "collectModule": {
                        "__typename": "TimedFeeCollectModuleSettings",
                        "type": "TimedFeeCollectModule",
                        "amount": {
                            "__typename": "ModuleFeeAmount",
                            "asset": {
                                "__typename": "Erc20",
                                "name": "DAI",
                                "symbol": "DAI",
                                "decimals": 18,
                                "address": "0x001B3B4d0F3714Ca98ba10F6042DaEbF0B1B7b6F"
                            },
                            "value": "0.1"
                        },
                        "recipient": "0x809BBaD32F441214A38D379d112C64618E41cB91",
                        "referralFee": 0,
                        "endTimestamp": "2023-04-13T21:39:23.000Z"
                    },
                    "referenceModule": null,
                    "appId": "test_api_e2e",
                    "hidden": false,
                    "reaction": null,
                    "mirrors": [],
                    "hasCollectedByMe": false,
                    "isGated": false
                }
            }
            """.data(using: .utf8)!
        }
    }

    // MARK: - Private interface

    private static func item(for data: Data) throws -> PublicationsQuery.Data.Publications.Item {
        var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
        let typename = try XCTUnwrap(dict["__typename"] as? String)
        dict["__fulfilled"] = Set([fetchAllFulfillmentObjectIdentifier(for: typename)])

        let json = JSONValue(dict)
        return PublicationsQuery.Data.Publications.Item(_dataDict: .init(data: try .init(_jsonValue: json)))
    }

    private static func fetchAllFulfillmentObjectIdentifier(for typename: String) -> ObjectIdentifier? {
        switch typename {
        case "Post":
          return ObjectIdentifier(PublicationsQuery.Data.Publications.Item.AsPost.self)
        case "Comment":
            return ObjectIdentifier(PublicationsQuery.Data.Publications.Item.AsComment.self)
        case "Mirror":
            return ObjectIdentifier(PublicationsQuery.Data.Publications.Item.AsMirror.self)
        default:
          return nil
        }
    }

    private static func fetchFulfillmentObjectIdentifier(for typename: String) -> ObjectIdentifier? {
        switch typename {
        case "Post":
            return ObjectIdentifier(PublicationQuery.Data.Publication.AsPost.self)
        case "Comment":
            return ObjectIdentifier(PublicationQuery.Data.Publication.AsComment.self)
        case "Mirror":
            return ObjectIdentifier(PublicationQuery.Data.Publication.AsMirror.self)
        default:
          return nil
        }
    }
}
