import Foundation

extension Stubs {
    static func feedFetch200ResponseJSON() -> Data {
        """
        {
          "data": {
            "feed": {
              "items": [
                {
                  "root": {
                    "id": "0x06-0x02",
                    "profile": {
                      "id": "0x06",
                      "name": null,
                      "bio": null,
                      "attributes": [],
                      "isFollowedByMe": true,
                      "isFollowing": false,
                      "followNftAddress": "0x4950D4cC58055341Ed88A106563C447D1Ee0dE56",
                      "metadata": null,
                      "isDefault": true,
                      "handle": "davidev.test",
                      "picture": null,
                      "coverPicture": null,
                      "ownedBy": "0x52EAF3F04cbac0a4B9878A75AB2523722325D4D4",
                      "dispatcher": {
                        "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F"
                      },
                      "stats": {
                        "totalFollowers": 43,
                        "totalFollowing": 0,
                        "totalPosts": 4,
                        "totalComments": 1,
                        "totalMirrors": 1,
                        "totalPublications": 6,
                        "totalCollects": 5,
                        "totalUpvotes": 234
                      },
                      "followModule": null
                    },
                    "stats": {
                      "totalUpvotes": 23,
                      "totalAmountOfMirrors": 2,
                      "totalAmountOfCollects": 2,
                      "totalAmountOfComments": 2
                    },
                    "metadata": {
                      "name": "Post by @davidev.test",
                      "description": "test",
                      "content": "test",
                      "media": [],
                      "attributes": [
                        {
                          "displayType": null,
                          "traitType": "string",
                          "value": "post"
                        }
                      ]
                    },
                    "createdAt": "2022-09-27T16:51:38.000Z",
                    "collectModule": {
                      "__typename": "FreeCollectModuleSettings",
                      "type": "FreeCollectModule",
                      "followerOnly": false,
                      "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                    },
                    "referenceModule": null,
                    "appId": "lenster",
                    "collectedBy": null,
                    "hidden": false,
                    "reaction": null,
                    "mirrors": [],
                    "hasCollectedByMe": false
                  },
                  "electedMirror": {
                    "mirrorId": "0x06-0x05",
                    "profile": {
                      "id": "0x06",
                      "handle": "davidev.test"
                    },
                    "timestamp": "2022-10-10T16:28:05.000Z"
                  },
                  "mirrors": [
                    {
                      "profile": {
                        "id": "0x06",
                        "handle": "davidev.test"
                      },
                      "timestamp": "2022-10-10T16:28:05.000Z"
                    }
                  ],
                  "collects": [],
                  "reactions": [],
                  "comments": [
                    {
                      "id": "0x06-0x06",
                      "profile": {
                        "id": "0x06",
                        "name": null,
                        "bio": null,
                        "attributes": [],
                        "isFollowedByMe": true,
                        "isFollowing": false,
                        "followNftAddress": "0x4950D4cC58055341Ed88A106563C447D1Ee0dE56",
                        "metadata": null,
                        "isDefault": true,
                        "handle": "davidev.test",
                        "picture": null,
                        "coverPicture": null,
                        "ownedBy": "0x52EAF3F04cbac0a4B9878A75AB2523722325D4D4",
                        "dispatcher": {
                          "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F"
                        },
                        "stats": {
                          "totalFollowers": 43,
                          "totalFollowing": 0,
                          "totalPosts": 4,
                          "totalComments": 1,
                          "totalMirrors": 1,
                          "totalPublications": 6,
                          "totalCollects": 5,
                          "totalUpvotes": 234
                        },
                        "followModule": null
                      },
                      "stats": {
                        "totalUpvotes": 23,
                        "totalAmountOfMirrors": 0,
                        "totalAmountOfCollects": 0,
                        "totalAmountOfComments": 1
                      },
                      "metadata": {
                        "name": "Comment by @davidev.test",
                        "description": "josh asked nicely, so i am commenting. thanks josh",
                        "content": "josh asked nicely, so i am commenting. thanks josh",
                        "media": [],
                        "attributes": []
                      },
                      "createdAt": "2022-10-10T16:33:36.000Z",
                      "collectModule": {
                        "__typename": "FreeCollectModuleSettings",
                        "type": "FreeCollectModule",
                        "followerOnly": false,
                        "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                      },
                      "referenceModule": null,
                      "appId": "lenster",
                      "collectedBy": null,
                      "hidden": false,
                      "reaction": null,
                      "mirrors": [],
                      "hasCollectedByMe": false,
                      "mainPost": {
                        "id": "0x06-0x02",
                        "profile": {
                          "id": "0x06",
                          "name": null,
                          "bio": null,
                          "attributes": [],
                          "isFollowedByMe": true,
                          "isFollowing": false,
                          "followNftAddress": "0x4950D4cC58055341Ed88A106563C447D1Ee0dE56",
                          "metadata": null,
                          "isDefault": true,
                          "handle": "davidev.test",
                          "picture": null,
                          "coverPicture": null,
                          "ownedBy": "0x52EAF3F04cbac0a4B9878A75AB2523722325D4D4",
                          "dispatcher": {
                            "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F"
                          },
                          "stats": {
                            "totalFollowers": 43,
                            "totalFollowing": 0,
                            "totalPosts": 4,
                            "totalComments": 1,
                            "totalMirrors": 1,
                            "totalPublications": 6,
                            "totalCollects": 5,
                            "totalUpvotes": 234
                          },
                          "followModule": null
                        },
                        "stats": {
                          "totalUpvotes": 23,
                          "totalAmountOfMirrors": 2,
                          "totalAmountOfCollects": 2,
                          "totalAmountOfComments": 2
                        },
                        "metadata": {
                          "name": "Post by @davidev.test",
                          "description": "test",
                          "content": "test",
                          "media": [],
                          "attributes": [
                            {
                              "displayType": null,
                              "traitType": "string",
                              "value": "post"
                            }
                          ]
                        },
                        "createdAt": "2022-09-27T16:51:38.000Z",
                        "collectModule": {
                          "__typename": "FreeCollectModuleSettings",
                          "type": "FreeCollectModule",
                          "followerOnly": false,
                          "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                        },
                        "referenceModule": null,
                        "appId": "lenster",
                        "collectedBy": null,
                        "hidden": false,
                        "reaction": null,
                        "mirrors": [],
                        "hasCollectedByMe": false
                      }
                    }
                  ]
                },
                {
                  "root": {
                    "id": "0x2f-0x01f4",
                    "profile": {
                      "id": "0x2f",
                      "name": "Sasi",
                      "bio": "creator of lenstube.xyz",
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "website",
                          "key": "website",
                          "value": "https://sasi.codes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "location",
                          "key": "location",
                          "value": "India"
                        },
                        {
                          "displayType": "string",
                          "traitType": "twitter",
                          "key": "twitter",
                          "value": "sasicodes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "key": "app",
                          "value": "lenstube"
                        }
                      ],
                      "isFollowedByMe": true,
                      "isFollowing": false,
                      "followNftAddress": "0x892f2077f1fAc7044FaA236A9530F38CF53206f6",
                      "metadata": "https://arweave.net/yN7RHvK1ln3xW_nhCmBuh-d34-ROu73uBhKmh660bQA",
                      "isDefault": true,
                      "handle": "sasicodes.test",
                      "picture": {
                        "original": {
                          "url": "ipfs://bafkreidippdvp2ukyzzjtp5ykggvrr5ujrivf47f5p3bec6fyzkdfins7u",
                          "mimeType": null
                        }
                      },
                      "coverPicture": {
                        "original": {
                          "url": "https://assets.lenstube.xyz/images/coverGradient.jpeg",
                          "mimeType": null
                        }
                      },
                      "ownedBy": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464",
                      "dispatcher": {
                        "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F"
                      },
                      "stats": {
                        "totalFollowers": 54,
                        "totalFollowing": 14,
                        "totalPosts": 266,
                        "totalComments": 141,
                        "totalMirrors": 69,
                        "totalPublications": 476,
                        "totalCollects": 200,
                        "totalUpvotes": 234
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
                          "value": "1.0"
                        },
                        "recipient": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464"
                      }
                    },
                    "stats": {
                      "totalUpvotes": 23,
                      "totalAmountOfMirrors": 0,
                      "totalAmountOfCollects": 0,
                      "totalAmountOfComments": 0
                    },
                    "metadata": {
                      "name": "teststst",
                      "description": "",
                      "content": "teststst",
                      "media": [
                        {
                          "original": {
                            "url": "https://arweave.net/p232ty-xtV2WlVocCfrakKi5lCPtVv3iR9ULnhyT_bY",
                            "mimeType": "video/mp4"
                          }
                        }
                      ],
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "publication",
                          "value": "video"
                        },
                        {
                          "displayType": "string",
                          "traitType": "handle",
                          "value": "sasicodes.test"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "value": "lenstube"
                        },
                        {
                          "displayType": "string",
                          "traitType": "durationInSeconds",
                          "value": "27.89"
                        }
                      ]
                    },
                    "createdAt": "2022-10-09T08:12:46.000Z",
                    "collectModule": {
                      "__typename": "FreeCollectModuleSettings",
                      "type": "FreeCollectModule",
                      "followerOnly": false,
                      "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                    },
                    "referenceModule": null,
                    "appId": "lenstube",
                    "collectedBy": null,
                    "hidden": false,
                    "reaction": null,
                    "mirrors": [],
                    "hasCollectedByMe": false
                  },
                  "electedMirror": null,
                  "mirrors": [],
                  "collects": [],
                  "reactions": [],
                  "comments": []
                },
                {
                  "root": {
                    "id": "0x2f-0x01f3",
                    "profile": {
                      "id": "0x2f",
                      "name": "Sasi",
                      "bio": "creator of lenstube.xyz",
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "website",
                          "key": "website",
                          "value": "https://sasi.codes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "location",
                          "key": "location",
                          "value": "India"
                        },
                        {
                          "displayType": "string",
                          "traitType": "twitter",
                          "key": "twitter",
                          "value": "sasicodes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "key": "app",
                          "value": "lenstube"
                        }
                      ],
                      "isFollowedByMe": true,
                      "isFollowing": false,
                      "followNftAddress": "0x892f2077f1fAc7044FaA236A9530F38CF53206f6",
                      "metadata": "https://arweave.net/yN7RHvK1ln3xW_nhCmBuh-d34-ROu73uBhKmh660bQA",
                      "isDefault": true,
                      "handle": "sasicodes.test",
                      "picture": {
                        "original": {
                          "url": "ipfs://bafkreidippdvp2ukyzzjtp5ykggvrr5ujrivf47f5p3bec6fyzkdfins7u",
                          "mimeType": null
                        }
                      },
                      "coverPicture": {
                        "original": {
                          "url": "https://assets.lenstube.xyz/images/coverGradient.jpeg",
                          "mimeType": null
                        }
                      },
                      "ownedBy": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464",
                      "dispatcher": {
                        "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F"
                      },
                      "stats": {
                        "totalFollowers": 54,
                        "totalFollowing": 14,
                        "totalPosts": 266,
                        "totalComments": 141,
                        "totalMirrors": 69,
                        "totalPublications": 476,
                        "totalCollects": 200,
                        "totalUpvotes": 234
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
                          "value": "1.0"
                        },
                        "recipient": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464"
                      }
                    },
                    "stats": {
                      "totalUpvotes": 23,
                      "totalAmountOfMirrors": 0,
                      "totalAmountOfCollects": 0,
                      "totalAmountOfComments": 0
                    },
                    "metadata": {
                      "name": "dasdads",
                      "description": "",
                      "content": "dasdads",
                      "media": [
                        {
                          "original": {
                            "url": "https://arweave.net/cwFS6M_jx6BxU-CRBTIZ3fCVW7wZBQG3Zupo8mZeoQo",
                            "mimeType": "video/mp4"
                          }
                        }
                      ],
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "publication",
                          "value": "video"
                        },
                        {
                          "displayType": "string",
                          "traitType": "handle",
                          "value": "sasicodes.test"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "value": "lenstube"
                        },
                        {
                          "displayType": "string",
                          "traitType": "durationInSeconds",
                          "value": "44.50"
                        }
                      ]
                    },
                    "createdAt": "2022-10-09T08:08:30.000Z",
                    "collectModule": {
                      "__typename": "FreeCollectModuleSettings",
                      "type": "FreeCollectModule",
                      "followerOnly": false,
                      "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                    },
                    "referenceModule": null,
                    "appId": "lenstube",
                    "collectedBy": null,
                    "hidden": false,
                    "reaction": null,
                    "mirrors": [],
                    "hasCollectedByMe": false
                  },
                  "electedMirror": null,
                  "mirrors": [],
                  "collects": [],
                  "reactions": [],
                  "comments": []
                },
                {
                  "root": {
                    "id": "0x2f-0x01f2",
                    "profile": {
                      "id": "0x2f",
                      "name": "Sasi",
                      "bio": "creator of lenstube.xyz",
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "website",
                          "key": "website",
                          "value": "https://sasi.codes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "location",
                          "key": "location",
                          "value": "India"
                        },
                        {
                          "displayType": "string",
                          "traitType": "twitter",
                          "key": "twitter",
                          "value": "sasicodes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "key": "app",
                          "value": "lenstube"
                        }
                      ],
                      "isFollowedByMe": true,
                      "isFollowing": false,
                      "followNftAddress": "0x892f2077f1fAc7044FaA236A9530F38CF53206f6",
                      "metadata": "https://arweave.net/yN7RHvK1ln3xW_nhCmBuh-d34-ROu73uBhKmh660bQA",
                      "isDefault": true,
                      "handle": "sasicodes.test",
                      "picture": {
                        "original": {
                          "url": "ipfs://bafkreidippdvp2ukyzzjtp5ykggvrr5ujrivf47f5p3bec6fyzkdfins7u",
                          "mimeType": null
                        }
                      },
                      "coverPicture": {
                        "original": {
                          "url": "https://assets.lenstube.xyz/images/coverGradient.jpeg",
                          "mimeType": null
                        }
                      },
                      "ownedBy": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464",
                      "dispatcher": {
                        "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F"
                      },
                      "stats": {
                        "totalFollowers": 54,
                        "totalFollowing": 14,
                        "totalPosts": 266,
                        "totalComments": 141,
                        "totalMirrors": 69,
                        "totalPublications": 476,
                        "totalCollects": 200,
                        "totalUpvotes": 234
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
                          "value": "1.0"
                        },
                        "recipient": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464"
                      }
                    },
                    "stats": {
                      "totalUpvotes": 23,
                      "totalAmountOfMirrors": 0,
                      "totalAmountOfCollects": 0,
                      "totalAmountOfComments": 0
                    },
                    "metadata": {
                      "name": "teststt",
                      "description": "",
                      "content": "teststt",
                      "media": [
                        {
                          "original": {
                            "url": "https://arweave.net/Ix-BIWBILptT3UMRC_srj4WlI_vbyuY6pGpwB8B4taI",
                            "mimeType": "video/mp4"
                          }
                        }
                      ],
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "publication",
                          "value": "video"
                        },
                        {
                          "displayType": "string",
                          "traitType": "handle",
                          "value": "sasicodes.test"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "value": "lenstube"
                        },
                        {
                          "displayType": "string",
                          "traitType": "durationInSeconds",
                          "value": "44.50"
                        }
                      ]
                    },
                    "createdAt": "2022-10-09T08:06:40.000Z",
                    "collectModule": {
                      "__typename": "FreeCollectModuleSettings",
                      "type": "FreeCollectModule",
                      "followerOnly": false,
                      "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                    },
                    "referenceModule": null,
                    "appId": "lenstube",
                    "collectedBy": null,
                    "hidden": false,
                    "reaction": null,
                    "mirrors": [],
                    "hasCollectedByMe": false
                  },
                  "electedMirror": null,
                  "mirrors": [],
                  "collects": [],
                  "reactions": [],
                  "comments": []
                },
                {
                  "root": {
                    "id": "0x2f-0x01f1",
                    "profile": {
                      "id": "0x2f",
                      "name": "Sasi",
                      "bio": "creator of lenstube.xyz",
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "website",
                          "key": "website",
                          "value": "https://sasi.codes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "location",
                          "key": "location",
                          "value": "India"
                        },
                        {
                          "displayType": "string",
                          "traitType": "twitter",
                          "key": "twitter",
                          "value": "sasicodes"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "key": "app",
                          "value": "lenstube"
                        }
                      ],
                      "isFollowedByMe": true,
                      "isFollowing": false,
                      "followNftAddress": "0x892f2077f1fAc7044FaA236A9530F38CF53206f6",
                      "metadata": "https://arweave.net/yN7RHvK1ln3xW_nhCmBuh-d34-ROu73uBhKmh660bQA",
                      "isDefault": true,
                      "handle": "sasicodes.test",
                      "picture": {
                        "original": {
                          "url": "ipfs://bafkreidippdvp2ukyzzjtp5ykggvrr5ujrivf47f5p3bec6fyzkdfins7u",
                          "mimeType": null
                        }
                      },
                      "coverPicture": {
                        "original": {
                          "url": "https://assets.lenstube.xyz/images/coverGradient.jpeg",
                          "mimeType": null
                        }
                      },
                      "ownedBy": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464",
                      "dispatcher": {
                        "address": "0x6C1e1bC39b13f9E0Af9424D76De899203F47755F"
                      },
                      "stats": {
                        "totalFollowers": 54,
                        "totalFollowing": 14,
                        "totalPosts": 266,
                        "totalComments": 141,
                        "totalMirrors": 69,
                        "totalPublications": 476,
                        "totalCollects": 200,
                        "totalUpvotes": 234
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
                          "value": "1.0"
                        },
                        "recipient": "0x01d79BcEaEaaDfb8fD2F2f53005289CFcF483464"
                      }
                    },
                    "stats": {
                      "totalUpvotes": 23,
                      "totalAmountOfMirrors": 0,
                      "totalAmountOfCollects": 0,
                      "totalAmountOfComments": 0
                    },
                    "metadata": {
                      "name": "sdasdasd",
                      "description": "",
                      "content": "sdasdasd",
                      "media": [
                        {
                          "original": {
                            "url": "https://arweave.net/2R2V770PHbmOgyvYyvk4NQxudR-cNYTgyhKWwvQtJQU",
                            "mimeType": "video/mp4"
                          }
                        }
                      ],
                      "attributes": [
                        {
                          "displayType": "string",
                          "traitType": "publication",
                          "value": "video"
                        },
                        {
                          "displayType": "string",
                          "traitType": "handle",
                          "value": "sasicodes.test"
                        },
                        {
                          "displayType": "string",
                          "traitType": "app",
                          "value": "lenstube"
                        },
                        {
                          "displayType": "string",
                          "traitType": "durationInSeconds",
                          "value": "44.50"
                        }
                      ]
                    },
                    "createdAt": "2022-10-09T07:55:58.000Z",
                    "collectModule": {
                      "__typename": "FreeCollectModuleSettings",
                      "type": "FreeCollectModule",
                      "followerOnly": false,
                      "contractAddress": "0x0BE6bD7092ee83D44a6eC1D949626FeE48caB30c"
                    },
                    "referenceModule": null,
                    "appId": "lenstube",
                    "collectedBy": null,
                    "hidden": false,
                    "reaction": null,
                    "mirrors": [],
                    "hasCollectedByMe": false
                  },
                  "electedMirror": null,
                  "mirrors": [],
                  "collects": [],
                  "reactions": [],
                  "comments": []
                }
              ],
              "pageInfo": {
                "prev": "prev_cursor",
                "next": "next_cursor",
                "totalCount": null
              }
            }
          }
        }
        """.data(using: .utf8)!
    }
}
