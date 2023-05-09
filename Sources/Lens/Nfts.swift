import Foundation

public protocol NftsType {
    func fetch(request: NFTsRequest) async throws -> NftsResponse
}

/**
  Fetches lists of NFTs
 */
public class Nfts: NftsType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    /**
     Fetch a user's NFTs

     You create a request using criteria for fetching the user's NFTs. For example, given a user's wallet address, if you wanted to fetch their NFTs, you could do the following:

     ```swift
     let nfts = Nfts()
     let ownerAddress = "0x0c0E611A29b339D8c1048F2Edf9d4160A5fb8F22"
     let chainId = "1"
     let request = NFTsRequest(ownerAddress: ownerAddress, chainIds: [chainId])
     let response = try await nfts.fetch(request: request)
     ```

     - Parameters request: The request parameters to use when fetching a user's NFTs
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing NFTs and page info
     */
    public func fetch(request: NFTsRequest) async throws -> NftsResponse {
        let query = NftsQuery(request: request)
        let data = try await client.request(query: query)

        return NftsResponse(response: data.nfts)
    }
}

public struct NftsResponse {
    public let items: [any NFT]
    public let pageInfo: PageInfo?

    init(response: NftsQuery.Data.Nfts) {
        self.items = response.items
        self.pageInfo = PageInfo(dataDict: response.pageInfo.__data)
    }
}
