// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct Erc20Fields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment Erc20Fields on Erc20 {
      __typename
      name
      symbol
      decimals
      address
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20 }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("name", String.self),
    .field("symbol", String.self),
    .field("decimals", Int.self),
    .field("address", Lens.ContractAddress.self),
  ] }

  public var name: String { __data["name"] }
  public var symbol: String { __data["symbol"] }
  public var decimals: Int { __data["decimals"] }
  public var address: Lens.ContractAddress { __data["address"] }
}
