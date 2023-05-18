import Foundation

public struct NFT: Identifiable {
    public let id = UUID()
    public let contractName: String
    public let contractAddress: String
    public let symbol: String
    public let tokenId: String
    public let owners: [any NFTOwner]
    public let name: String
    public let description: String
    public let contentURI: String
    public let originalContent: any NFTOriginalContent
    public let chainId: Int
    public let collectionName: String
    public let ercType: String

    init(nft: any SomeNFT) {
        self.contractName = nft.contractName
        self.contractAddress = nft.contractAddress
        self.symbol = nft.symbol
        self.tokenId = nft.tokenId
        self.owners = nft.owners
        self.name = nft.name
        self.description = nft.description
        self.contentURI = nft.contentURI
        self.originalContent = nft.originalContent
        self.chainId = nft.chainId
        self.collectionName = nft.collectionName
        self.ercType = nft.ercType
    }
}

extension NFT: Equatable {
    public static func == (lhs: NFT, rhs: NFT) -> Bool {
        lhs.contractAddress == rhs.contractAddress && lhs.tokenId == rhs.tokenId
    }
}

protocol SomeNFT {
    associatedtype O: NFTOwner
    associatedtype OC: NFTOriginalContent

    var contractName: String { get }
    var contractAddress: String { get }
    var symbol: String { get }
    var tokenId: String { get }
    var owners: [O] { get }
    var name: String { get }
    var description: String { get }
    var contentURI: String { get }
    var originalContent: OC { get }
    var chainId: Int { get }
    var collectionName: String { get }
    var ercType: String { get }
}

extension NftsQuery.Data.Nfts.Item: SomeNFT {}


public protocol NFTOwner {
    var amount: Double { get }
    var address: String { get }
}

extension NftsQuery.Data.Nfts.Item.Owner: NFTOwner {}


public protocol NFTOriginalContent {
    var uri: String { get }
    var metaType: String { get }
}

extension NftsQuery.Data.Nfts.Item.OriginalContent: NFTOriginalContent {}

#if DEBUG
extension NFT {
    public enum Error: Swift.Error {
        case failedToParseJson
    }

    public static func listFromJson(_ data: Data) throws -> [NFT] {
        guard let items = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyHashable]] else {
            throw Error.failedToParseJson
        }

        return items.compactMap({ dict in
            var dict = dict
            dict["__fulfilled"] = Set([ObjectIdentifier(NftsQuery.Data.Nfts.Item.self)])
            let json = JSONValue(dict)

            do {
                let data = try JSONObject(_jsonValue: json)
                let nftItem = NftsQuery.Data.Nfts.Item(_dataDict: .init(data: data))
                return NFT(nft: nftItem)
            } catch {
                return nil
            }
        })
    }
}
#endif
