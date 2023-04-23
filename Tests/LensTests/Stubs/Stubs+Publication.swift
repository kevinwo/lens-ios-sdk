import Foundation
import Lens
import XCTest

extension Stubs {
    enum Publication {
        static func testPost() throws -> ExplorePublicationsQuery.Data.ExplorePublications.Item {
            let data = Stubs.Publication.testPostData
            return try item(for: data)
        }

        static func testComment() throws -> ExplorePublicationsQuery.Data.ExplorePublications.Item {
            let data = Stubs.Publication.testCommentData
            return try item(for: data)
        }

        static var testPostData: Data {
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

        static var testCommentData: Data {
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

    private static func item(for data: Data) throws -> ExplorePublicationsQuery.Data.ExplorePublications.Item {
        var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
        let typename = try XCTUnwrap(dict["__typename"] as? String)
        dict["__fulfilled"] = Set([fulfillmentObjectIdentifier(for: typename)])

        let json = JSONValue(dict)
        return ExplorePublicationsQuery.Data.ExplorePublications.Item(_dataDict: .init(data: try .init(_jsonValue: json)))
    }

    private static func fulfillmentObjectIdentifier(for typename: String) -> ObjectIdentifier? {
        switch typename {
        case "Post":
          return ObjectIdentifier(ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.self)
        case "Comment":
            return ObjectIdentifier(ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.self)
        case "Mirror":
            return ObjectIdentifier(Lens.ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.self)
        default:
          return nil
        }
    }
}
