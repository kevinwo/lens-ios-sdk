// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct EoaOwnershipFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment EoaOwnershipFields on EoaOwnershipOutput {
      __typename
      address
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("address", Lens.EthereumAddress.self),
  ] }

  public var address: Lens.EthereumAddress { __data["address"] }
}
