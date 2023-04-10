// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct NftOwnershipFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment NftOwnershipFields on NftOwnershipOutput {
      __typename
      contractAddress
      chainID
      contractType
      tokenIds
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("contractAddress", Lens.ContractAddress.self),
    .field("chainID", Lens.ChainId.self),
    .field("contractType", GraphQLEnum<Lens.ContractType>.self),
    .field("tokenIds", [Lens.TokenId]?.self),
  ] }

  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
  public var chainID: Lens.ChainId { __data["chainID"] }
  public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
  public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }
}
