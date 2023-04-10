// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct Erc20OwnershipFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment Erc20OwnershipFields on Erc20OwnershipOutput {
      __typename
      contractAddress
      amount
      chainID
      condition
      decimals
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("contractAddress", Lens.ContractAddress.self),
    .field("amount", String.self),
    .field("chainID", Lens.ChainId.self),
    .field("condition", GraphQLEnum<Lens.ScalarOperator>.self),
    .field("decimals", Double.self),
  ] }

  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
  public var amount: String { __data["amount"] }
  public var chainID: Lens.ChainId { __data["chainID"] }
  public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
  public var decimals: Double { __data["decimals"] }
}
