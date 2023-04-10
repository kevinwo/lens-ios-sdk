// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct FollowModuleFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment FollowModuleFields on FollowModule {
      __typename
      ... on FeeFollowModuleSettings {
        type
        amount {
          __typename
          asset {
            __typename
            name
            symbol
            decimals
            address
          }
          value
        }
        recipient
      }
      ... on ProfileFollowModuleSettings {
        type
        contractAddress
      }
      ... on RevertFollowModuleSettings {
        type
        contractAddress
      }
      ... on UnknownFollowModuleSettings {
        type
        contractAddress
        followModuleReturnData
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Unions.FollowModule }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .inlineFragment(AsFeeFollowModuleSettings.self),
    .inlineFragment(AsProfileFollowModuleSettings.self),
    .inlineFragment(AsRevertFollowModuleSettings.self),
    .inlineFragment(AsUnknownFollowModuleSettings.self),
  ] }

  public var asFeeFollowModuleSettings: AsFeeFollowModuleSettings? { _asInlineFragment() }
  public var asProfileFollowModuleSettings: AsProfileFollowModuleSettings? { _asInlineFragment() }
  public var asRevertFollowModuleSettings: AsRevertFollowModuleSettings? { _asInlineFragment() }
  public var asUnknownFollowModuleSettings: AsUnknownFollowModuleSettings? { _asInlineFragment() }

  /// AsFeeFollowModuleSettings
  ///
  /// Parent Type: `FeeFollowModuleSettings`
  public struct AsFeeFollowModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = FollowModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FeeFollowModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.FollowModules>.self),
      .field("amount", Amount.self),
      .field("recipient", Lens.EthereumAddress.self),
    ] }

    public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
    public var amount: Amount { __data["amount"] }
    public var recipient: Lens.EthereumAddress { __data["recipient"] }

    /// AsFeeFollowModuleSettings.Amount
    ///
    /// Parent Type: `ModuleFeeAmount`
    public struct Amount: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ModuleFeeAmount }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("asset", Asset.self),
        .field("value", String.self),
      ] }

      public var asset: Asset { __data["asset"] }
      public var value: String { __data["value"] }

      /// AsFeeFollowModuleSettings.Amount.Asset
      ///
      /// Parent Type: `Erc20`
      public struct Asset: Lens.SelectionSet {
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
    }
  }

  /// AsProfileFollowModuleSettings
  ///
  /// Parent Type: `ProfileFollowModuleSettings`
  public struct AsProfileFollowModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = FollowModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileFollowModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.FollowModules>.self),
      .field("contractAddress", Lens.ContractAddress.self),
    ] }

    public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
  }

  /// AsRevertFollowModuleSettings
  ///
  /// Parent Type: `RevertFollowModuleSettings`
  public struct AsRevertFollowModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = FollowModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RevertFollowModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.FollowModules>.self),
      .field("contractAddress", Lens.ContractAddress.self),
    ] }

    public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
  }

  /// AsUnknownFollowModuleSettings
  ///
  /// Parent Type: `UnknownFollowModuleSettings`
  public struct AsUnknownFollowModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = FollowModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.UnknownFollowModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.FollowModules>.self),
      .field("contractAddress", Lens.ContractAddress.self),
      .field("followModuleReturnData", Lens.FollowModuleData.self),
    ] }

    public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
    public var followModuleReturnData: Lens.FollowModuleData { __data["followModuleReturnData"] }
  }
}
