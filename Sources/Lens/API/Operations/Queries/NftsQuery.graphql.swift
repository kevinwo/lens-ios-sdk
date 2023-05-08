// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class NftsQuery: GraphQLQuery {
  public static let operationName: String = "nfts"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query nfts($request: NFTsRequest!) {
        nfts(request: $request) {
          __typename
          items {
            __typename
            contractName
            contractAddress
            symbol
            tokenId
            owners {
              __typename
              amount
              address
            }
            name
            description
            contentURI
            originalContent {
              __typename
              uri
              metaType
            }
            chainId
            collectionName
            ercType
          }
          pageInfo {
            __typename
            ...CommonPaginatedResultInfoFields
          }
        }
      }
      """#,
      fragments: [CommonPaginatedResultInfoFields.self]
    ))

  public var request: NFTsRequest

  public init(request: NFTsRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("nfts", Nfts.self, arguments: ["request": .variable("request")]),
    ] }

    public var nfts: Nfts { __data["nfts"] }

    /// Nfts
    ///
    /// Parent Type: `NFTsResult`
    public struct Nfts: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NFTsResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("items", [Item].self),
        .field("pageInfo", PageInfo.self),
      ] }

      public var items: [Item] { __data["items"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }

      /// Nfts.Item
      ///
      /// Parent Type: `NFT`
      public struct Item: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NFT }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("contractName", String.self),
          .field("contractAddress", Lens.ContractAddress.self),
          .field("symbol", String.self),
          .field("tokenId", String.self),
          .field("owners", [Owner].self),
          .field("name", String.self),
          .field("description", String.self),
          .field("contentURI", String.self),
          .field("originalContent", OriginalContent.self),
          .field("chainId", Lens.ChainId.self),
          .field("collectionName", String.self),
          .field("ercType", String.self),
        ] }

        public var contractName: String { __data["contractName"] }
        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var symbol: String { __data["symbol"] }
        public var tokenId: String { __data["tokenId"] }
        public var owners: [Owner] { __data["owners"] }
        public var name: String { __data["name"] }
        public var description: String { __data["description"] }
        public var contentURI: String { __data["contentURI"] }
        public var originalContent: OriginalContent { __data["originalContent"] }
        public var chainId: Lens.ChainId { __data["chainId"] }
        public var collectionName: String { __data["collectionName"] }
        public var ercType: String { __data["ercType"] }

        /// Nfts.Item.Owner
        ///
        /// Parent Type: `Owner`
        public struct Owner: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Owner }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("amount", Double.self),
            .field("address", Lens.EthereumAddress.self),
          ] }

          public var amount: Double { __data["amount"] }
          public var address: Lens.EthereumAddress { __data["address"] }
        }

        /// Nfts.Item.OriginalContent
        ///
        /// Parent Type: `NFTContent`
        public struct OriginalContent: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NFTContent }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("uri", String.self),
            .field("metaType", String.self),
          ] }

          public var uri: String { __data["uri"] }
          public var metaType: String { __data["metaType"] }
        }
      }

      /// Nfts.PageInfo
      ///
      /// Parent Type: `PaginatedResultInfo`
      public struct PageInfo: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PaginatedResultInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CommonPaginatedResultInfoFields.self),
        ] }

        public var prev: Lens.Cursor? { __data["prev"] }
        public var next: Lens.Cursor? { __data["next"] }
        @available(*, deprecated, message: "Total counts is expensive and in dynamic nature of queries it slows stuff down. Most the time you do not need this you can just use the `next` property to see if there is more data. This will be removed soon. The only use case anyone is using this right now is on notification query, this should be changed to query the notifications and cache the last notification id. You can then keep checking if the id changes you know more notifications.")
        public var totalCount: Int? { __data["totalCount"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var commonPaginatedResultInfoFields: CommonPaginatedResultInfoFields { _toFragment() }
        }
      }
    }
  }
}
