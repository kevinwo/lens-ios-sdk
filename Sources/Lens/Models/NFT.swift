import Foundation

public protocol NFT {
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
    var chainId: String { get }
    var collectionName: String { get }
    var ercType: String { get }
}

extension NftsQuery.Data.Nfts.Item: NFT {}


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
