#if DEBUG
import Foundation
import Lens
import XCTest

extension Stubs {
    public enum Nfts {
        public static func fetch() throws -> NftsQuery.Data {
            let data = fetch200ResponseJSON()
            var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
            var dictData = try XCTUnwrap(dict["data"] as? [String: AnyHashable])
            var nfts = try XCTUnwrap(dictData["nfts"] as? [String: AnyHashable])
            let items = try XCTUnwrap(nfts["items"] as? [[String: AnyHashable]])
            nfts["items"] = items.map({ dict in
                var dict = dict
                dict["__fulfilled"] = Set([ObjectIdentifier(NftsQuery.Data.Nfts.Item.self)])
                return dict
            })

            dictData["nfts"] = nfts
            dict["data"] = dictData

            let json = JSONValue(dict["data"])

            return NftsQuery.Data(
                _dataDict: .init(
                    data: try .init(_jsonValue: json)
                )
            )
        }

        public static func fetch200ResponseJSON() -> Data {
            """
            {
              "data": {
                "nfts": {
                  "items": [
                    {
                      "contractName": "Origin Stories 1",
                      "contractAddress": "0x54439D4908A3E19356F876aa6022D67d0b3B12d6",
                      "symbol": "ORIGIN1",
                      "tokenId": "5742",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "Origin Stories 1: Mad Clown, Sad Town",
                      "description": "Before she was a tough-as-nails lead member of the PUNKS crew, Courtney had humble beginnings. Okay, she was always tough as nails, but to follow her dreams she had to carve her own path. Coming from a small town, Courtney had to go it alone, overcome major fears and doubts, and finally take a major leap of faith to make it in… ORIGIN CITY.",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmRpVH1xubDpNJ5RUqjnhE9DLU99R44NtZqs1s59pH7qBB",
                      "originalContent": {
                        "uri": "ipfs://QmP7vzEULM45qZkYnTdejrDhprEM9xmCNHztaNgffEZvcm",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "Origin Stories 1",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "Origin Stories 1",
                      "contractAddress": "0x54439D4908A3E19356F876aa6022D67d0b3B12d6",
                      "symbol": "ORIGIN1",
                      "tokenId": "5741",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "Origin Stories 1: Mad Clown, Sad Town",
                      "description": "Before she was a tough-as-nails lead member of the PUNKS crew, Courtney had humble beginnings. Okay, she was always tough as nails, but to follow her dreams she had to carve her own path. Coming from a small town, Courtney had to go it alone, overcome major fears and doubts, and finally take a major leap of faith to make it in… ORIGIN CITY.",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmRpVH1xubDpNJ5RUqjnhE9DLU99R44NtZqs1s59pH7qBB",
                      "originalContent": {
                        "uri": "ipfs://QmP7vzEULM45qZkYnTdejrDhprEM9xmCNHztaNgffEZvcm",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "Origin Stories 1",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "Origin Stories 1",
                      "contractAddress": "0x54439D4908A3E19356F876aa6022D67d0b3B12d6",
                      "symbol": "ORIGIN1",
                      "tokenId": "5740",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "Origin Stories 1: Mad Clown, Sad Town",
                      "description": "Before she was a tough-as-nails lead member of the PUNKS crew, Courtney had humble beginnings. Okay, she was always tough as nails, but to follow her dreams she had to carve her own path. Coming from a small town, Courtney had to go it alone, overcome major fears and doubts, and finally take a major leap of faith to make it in… ORIGIN CITY.",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmRpVH1xubDpNJ5RUqjnhE9DLU99R44NtZqs1s59pH7qBB",
                      "originalContent": {
                        "uri": "ipfs://QmP7vzEULM45qZkYnTdejrDhprEM9xmCNHztaNgffEZvcm",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "Origin Stories 1",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "Origin Stories 1",
                      "contractAddress": "0x54439D4908A3E19356F876aa6022D67d0b3B12d6",
                      "symbol": "ORIGIN1",
                      "tokenId": "5739",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "Origin Stories 1: Mad Clown, Sad Town",
                      "description": "Before she was a tough-as-nails lead member of the PUNKS crew, Courtney had humble beginnings. Okay, she was always tough as nails, but to follow her dreams she had to carve her own path. Coming from a small town, Courtney had to go it alone, overcome major fears and doubts, and finally take a major leap of faith to make it in… ORIGIN CITY.",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmRpVH1xubDpNJ5RUqjnhE9DLU99R44NtZqs1s59pH7qBB",
                      "originalContent": {
                        "uri": "ipfs://QmP7vzEULM45qZkYnTdejrDhprEM9xmCNHztaNgffEZvcm",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "Origin Stories 1",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "Origin Stories 1",
                      "contractAddress": "0x54439D4908A3E19356F876aa6022D67d0b3B12d6",
                      "symbol": "ORIGIN1",
                      "tokenId": "5738",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "Origin Stories 1: Mad Clown, Sad Town",
                      "description": "Before she was a tough-as-nails lead member of the PUNKS crew, Courtney had humble beginnings. Okay, she was always tough as nails, but to follow her dreams she had to carve her own path. Coming from a small town, Courtney had to go it alone, overcome major fears and doubts, and finally take a major leap of faith to make it in… ORIGIN CITY.",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmRpVH1xubDpNJ5RUqjnhE9DLU99R44NtZqs1s59pH7qBB",
                      "originalContent": {
                        "uri": "ipfs://QmP7vzEULM45qZkYnTdejrDhprEM9xmCNHztaNgffEZvcm",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "Origin Stories 1",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "Origin Stories 1",
                      "contractAddress": "0x54439D4908A3E19356F876aa6022D67d0b3B12d6",
                      "symbol": "ORIGIN1",
                      "tokenId": "5737",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "Origin Stories 1: Mad Clown, Sad Town",
                      "description": "Before she was a tough-as-nails lead member of the PUNKS crew, Courtney had humble beginnings. Okay, she was always tough as nails, but to follow her dreams she had to carve her own path. Coming from a small town, Courtney had to go it alone, overcome major fears and doubts, and finally take a major leap of faith to make it in… ORIGIN CITY.",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmRpVH1xubDpNJ5RUqjnhE9DLU99R44NtZqs1s59pH7qBB",
                      "originalContent": {
                        "uri": "ipfs://QmP7vzEULM45qZkYnTdejrDhprEM9xmCNHztaNgffEZvcm",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "Origin Stories 1",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "Tubby Cats",
                      "contractAddress": "0xCa7cA7BcC765F77339bE2d648BA53ce9c8a262bD",
                      "symbol": "TUBBY",
                      "tokenId": "4193",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "Tubby Cats",
                      "description": "",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmWEsF23zM2C1afa6G9XwgBhqJsPH9CyQTDpToap1MD4Un",
                      "originalContent": {
                        "uri": "ipfs://QmXRJbXFUHPbHy6hLcVtrcUiEiWyPtXSGjgsH5RexMwMmd",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "Tubby Cats",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "BoredApeYachtClub",
                      "contractAddress": "0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D",
                      "symbol": "BAYC",
                      "tokenId": "6518",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "BoredApeYachtClub",
                      "description": "",
                      "contentURI": "https://ipfs.moralis.io:2053/ipfs/QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/6518",
                      "originalContent": {
                        "uri": "ipfs://QmTL41cWQGXXVEfvy9YiRfmx9NmEoQoiQVtVoSeWrrVDwS",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "BoredApeYachtClub",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "3Landers",
                      "contractAddress": "0xb4d06d46A8285F4EC79Fd294F78a881799d8cEd9",
                      "symbol": "3L",
                      "tokenId": "4766",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "3Landers",
                      "description": "3Landers is a collectible NFT project centered around community, adventure, and collaboration.",
                      "contentURI": "https://ipfs.io/ipfs/QmNWziXfkdZRTY6ZQHkHGUe8smUCNGPT4umrpQ8KVjqNDB/",
                      "originalContent": {
                        "uri": "https://ipfs.io/ipfs/Qmb2t58xgmTFaZUxgPV1tfBkD1zP4avYf55RKevdCAHGSH/",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "3Landers",
                      "ercType": "ERC721"
                    },
                    {
                      "contractName": "3Landers",
                      "contractAddress": "0xb4d06d46A8285F4EC79Fd294F78a881799d8cEd9",
                      "symbol": "3L",
                      "tokenId": "4765",
                      "owners": [
                        {
                          "amount": 1,
                          "address": "0x54BE3a794282C030b15E43aE2bB182E14c409C5e"
                        }
                      ],
                      "name": "3Landers",
                      "description": "3Landers is a collectible NFT project centered around community, adventure, and collaboration.",
                      "contentURI": "https://ipfs.io/ipfs/QmNWziXfkdZRTY6ZQHkHGUe8smUCNGPT4umrpQ8KVjqNDB/",
                      "originalContent": {
                        "uri": "https://ipfs.io/ipfs/Qmb2t58xgmTFaZUxgPV1tfBkD1zP4avYf55RKevdCAHGSH/",
                        "metaType": "unknown"
                      },
                      "chainId": 1,
                      "collectionName": "3Landers",
                      "ercType": "ERC721"
                    }
                  ],
                  "pageInfo": {
                    "prev": "cursor",
                    "next": "cursor",
                    "totalCount": 4023
                  }
                }
              }
            }
            """.data(using: .utf8)!
        }
    }
}
#endif
