import Foundation
import Lens

public extension Stubs {
  enum Explore {
    public static func emptyPublications() throws -> ExplorePublicationsQuery.Data.ExplorePublications {
      let items: [[String: AnyHashable]] = []
      let results = ["items": items] as! [String: AnyHashable]
      let json = JSONValue(results)
      return ExplorePublicationsQuery.Data.ExplorePublications(
        _dataDict: .init(
          data: try .init(_jsonValue: json)
        )
      )
    }

    public static func publications() throws -> ExplorePublicationsQuery.Data.ExplorePublications {
      let data = publicationsItemsJSON()
      var results = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyHashable]

      /// I don't like this work around, but I have yet to figure out why the valid JSON response stubs
      /// do not end up parsing correctly with fulfilled values (works just fine on production when
      /// live fetching). Therefore, forcing the type fulfillment for testing.
      var items = results["items"] as! [[String: AnyHashable]]
      items.enumerated().forEach { index, element in
        let objectIdentifier: ObjectIdentifier? = {
          switch element["__typename"] as? String {
          case "Post":
            return ObjectIdentifier(Lens.ExplorePublicationsQuery.Data.ExplorePublications.Item.AsPost.self)
          case "Comment":
            return ObjectIdentifier(Lens.ExplorePublicationsQuery.Data.ExplorePublications.Item.AsComment.self)
          case "Mirror":
            return ObjectIdentifier(Lens.ExplorePublicationsQuery.Data.ExplorePublications.Item.AsMirror.self)
          default:
            return nil
          }
        }()

        if let objectIdentifier {
          items[index]["__fulfilled"] = Set([objectIdentifier])
        }
      }
      results["items"] = items
      print(results)
      let json = JSONValue(results)

      return ExplorePublicationsQuery.Data.ExplorePublications(
        _dataDict: .init(
          data: try .init(_jsonValue: json)
        )
      )
    }

    public static func publicationsItemsJSON() -> Data {
            """
            {
              "items": [{
                "__typename": "Post",
                "id": "0x7392-0x0142",
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
                  "totalAmountOfComments": 1
                },
                "metadata": {
                  "__typename": "MetadataOutput",
                  "name": "Audio Post Aave Testing",
                  "description": "Audio Post created for testing purposes",
                  "content": "Content related to Audio Publication for testing",
                  "media": [{
                    "__typename": "MediaSet",
                    "original": {
                      "__typename": "Media",
                      "url": "https://static-lens-staging-qa.s3.eu-west-1.amazonaws.com/audio_post.mp3",
                      "width": null,
                      "height": null,
                      "mimeType": "audio/mpeg"
                    },
                    "small": null,
                    "medium": null
                  }],
                  "attributes": [],
                  "encryptionParams": null
                },
                "createdAt": "2023-04-13T11:07:03.000Z",
                "collectModule": {
                  "__typename": "LimitedFeeCollectModuleSettings",
                  "type": "LimitedFeeCollectModule",
                  "collectLimit": "1",
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
                  "referralFee": 0
                },
                "referenceModule": null,
                "appId": "test_api_e2e",
                "hidden": false,
                "reaction": null,
                "mirrors": [],
                "hasCollectedByMe": false,
                "isGated": false
              }, {
                "__typename": "Post",
                "id": "0x5b94-0x0350",
                "profile": {
                  "__typename": "Profile",
                  "id": "0x5b94",
                  "name": null,
                  "bio": null,
                  "attributes": [],
                  "isFollowedByMe": false,
                  "isFollowing": false,
                  "followNftAddress": "0x4EF4AB33e24077DEb3A3626962E9eaA62D5Bdd18",
                  "metadata": null,
                  "isDefault": false,
                  "handle": "qatest9537.test",
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
                  "ownedBy": "0xc699ac3f45b56DE35fC59628109131C5930714eB",
                  "dispatcher": {
                    "__typename": "Dispatcher",
                    "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F",
                    "canUseRelay": true
                  },
                  "stats": {
                    "__typename": "ProfileStats",
                    "totalFollowers": 7,
                    "totalFollowing": 0,
                    "totalPosts": 856,
                    "totalComments": 0,
                    "totalMirrors": 0,
                    "totalPublications": 856,
                    "totalCollects": 84,
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
                  "name": "Image Post Aave Testing",
                  "description": "Image Post created for testing purposes",
                  "content": "Content related to Image Publication for testing",
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
                "createdAt": "2023-04-13T11:55:23.000Z",
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
                "isGated": false
              }, {
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
              }, {
                "__typename": "Post",
                "id": "0x7392-0x0166",
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
                  "totalAmountOfComments": 1
                },
                "metadata": {
                  "__typename": "MetadataOutput",
                  "name": "Audio Post Aave Testing",
                  "description": "Audio Post created for testing purposes",
                  "content": "Content related to Audio Publication for testing",
                  "media": [{
                    "__typename": "MediaSet",
                    "original": {
                      "__typename": "Media",
                      "url": "https://static-lens-staging-qa.s3.eu-west-1.amazonaws.com/audio_post.mp3",
                      "width": null,
                      "height": null,
                      "mimeType": "audio/mpeg"
                    },
                    "small": null,
                    "medium": null
                  }],
                  "attributes": [],
                  "encryptionParams": null
                },
                "createdAt": "2023-04-13T12:17:53.000Z",
                "collectModule": {
                  "__typename": "FreeCollectModuleSettings",
                  "type": "FreeCollectModule",
                  "followerOnly": true,
                  "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                },
                "referenceModule": null,
                "appId": "test_api_e2e",
                "hidden": false,
                "reaction": null,
                "mirrors": [],
                "hasCollectedByMe": false,
                "isGated": false
              }, {
                "__typename": "Post",
                "id": "0x7392-0x016f",
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
                  "totalAmountOfMirrors": 1,
                  "totalAmountOfCollects": 0,
                  "totalAmountOfComments": 1
                },
                "metadata": {
                  "__typename": "MetadataOutput",
                  "name": "Image Post Aave Testing",
                  "description": "Image Post created for testing purposes",
                  "content": "Content related to Image Publication for testing",
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
                "createdAt": "2023-04-13T12:24:25.000Z",
                "collectModule": {
                  "__typename": "LimitedTimedFeeCollectModuleSettings",
                  "type": "LimitedTimedFeeCollectModule",
                  "collectLimit": "5",
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
                  "endTimestamp": "2023-04-14T12:24:25.000Z"
                },
                "referenceModule": null,
                "appId": "test_api_e2e",
                "hidden": false,
                "reaction": null,
                "mirrors": [],
                "hasCollectedByMe": false,
                "isGated": false
              }, {
                "__typename": "Post",
                "id": "0x760c-0x07",
                "profile": {
                  "__typename": "Profile",
                  "id": "0x760c",
                  "name": null,
                  "bio": null,
                  "attributes": [],
                  "isFollowedByMe": false,
                  "isFollowing": false,
                  "followNftAddress": null,
                  "metadata": null,
                  "isDefault": false,
                  "handle": "parker.test",
                  "picture": {
                    "__typename": "MediaSet",
                    "original": {
                      "__typename": "Media",
                      "url": "https://cdn.stamp.fyi/avatar/eth:0xe17281c17443b90a145d1a103d57189ffb2d912f?s=300",
                      "width": null,
                      "height": null,
                      "mimeType": null
                    },
                    "small": null,
                    "medium": null
                  },
                  "coverPicture": null,
                  "ownedBy": "0xE17281c17443b90A145d1a103d57189ffB2D912f",
                  "dispatcher": null,
                  "stats": {
                    "__typename": "ProfileStats",
                    "totalFollowers": 0,
                    "totalFollowing": 3,
                    "totalPosts": 3,
                    "totalComments": 5,
                    "totalMirrors": 2,
                    "totalPublications": 10,
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
                  "totalAmountOfComments": 2
                },
                "metadata": {
                  "__typename": "MetadataOutput",
                  "name": "Post by @parker.test",
                  "description": null,
                  "content": "gm",
                  "media": [{
                    "__typename": "MediaSet",
                    "original": {
                      "__typename": "Media",
                      "url": "ipfs://bafkreiebsgc6czn47wqhwmagvsyg2hw5n24pka4eh5oedzzugwgtndll6u",
                      "width": null,
                      "height": null,
                      "mimeType": "image/jpeg"
                    },
                    "small": null,
                    "medium": null
                  }],
                  "attributes": [{
                    "__typename": "MetadataAttributeOutput",
                    "displayType": "string",
                    "traitType": "type",
                    "value": "image"
                  }],
                  "encryptionParams": null
                },
                "createdAt": "2023-04-13T02:30:31.000Z",
                "collectModule": {
                  "__typename": "RevertCollectModuleSettings",
                  "type": "RevertCollectModule"
                },
                "referenceModule": null,
                "appId": "lenster",
                "hidden": false,
                "reaction": null,
                "mirrors": [],
                "hasCollectedByMe": false,
                "isGated": false
              }],
              "pageInfo": {
                "__typename": "PaginatedResultInfo",
                "prev": {
                  "timestamp": 1681308197000,
                  "offset": 0
                },
                "next": {
                  "timestamp": 1681308197000,
                  "offset": 25,
                  "totalCount": null
                }
              }
            }
            """.data(using: .utf8)!
    }
  }
}
