// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CollectModuleFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment CollectModuleFields on CollectModule {
      __typename
      ... on FreeCollectModuleSettings {
        type
        followerOnly
        contractAddress
      }
      ... on FeeCollectModuleSettings {
        type
        amount {
          __typename
          asset {
            __typename
            ...Erc20Fields
          }
          value
        }
        recipient
        referralFee
      }
      ... on LimitedFeeCollectModuleSettings {
        type
        collectLimit
        amount {
          __typename
          asset {
            __typename
            ...Erc20Fields
          }
          value
        }
        recipient
        referralFee
      }
      ... on LimitedTimedFeeCollectModuleSettings {
        type
        collectLimit
        amount {
          __typename
          asset {
            __typename
            ...Erc20Fields
          }
          value
        }
        recipient
        referralFee
        endTimestamp
      }
      ... on RevertCollectModuleSettings {
        type
      }
      ... on TimedFeeCollectModuleSettings {
        type
        amount {
          __typename
          asset {
            __typename
            ...Erc20Fields
          }
          value
        }
        recipient
        referralFee
        endTimestamp
      }
      ... on UnknownCollectModuleSettings {
        type
        contractAddress
        collectModuleReturnData
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Unions.CollectModule }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .inlineFragment(AsFreeCollectModuleSettings.self),
    .inlineFragment(AsFeeCollectModuleSettings.self),
    .inlineFragment(AsLimitedFeeCollectModuleSettings.self),
    .inlineFragment(AsLimitedTimedFeeCollectModuleSettings.self),
    .inlineFragment(AsRevertCollectModuleSettings.self),
    .inlineFragment(AsTimedFeeCollectModuleSettings.self),
    .inlineFragment(AsUnknownCollectModuleSettings.self),
  ] }

  public var asFreeCollectModuleSettings: AsFreeCollectModuleSettings? { _asInlineFragment() }
  public var asFeeCollectModuleSettings: AsFeeCollectModuleSettings? { _asInlineFragment() }
  public var asLimitedFeeCollectModuleSettings: AsLimitedFeeCollectModuleSettings? { _asInlineFragment() }
  public var asLimitedTimedFeeCollectModuleSettings: AsLimitedTimedFeeCollectModuleSettings? { _asInlineFragment() }
  public var asRevertCollectModuleSettings: AsRevertCollectModuleSettings? { _asInlineFragment() }
  public var asTimedFeeCollectModuleSettings: AsTimedFeeCollectModuleSettings? { _asInlineFragment() }
  public var asUnknownCollectModuleSettings: AsUnknownCollectModuleSettings? { _asInlineFragment() }

  /// AsFreeCollectModuleSettings
  ///
  /// Parent Type: `FreeCollectModuleSettings`
  public struct AsFreeCollectModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = CollectModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FreeCollectModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.CollectModules>.self),
      .field("followerOnly", Bool.self),
      .field("contractAddress", Lens.ContractAddress.self),
    ] }

    public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
    public var followerOnly: Bool { __data["followerOnly"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
  }

  /// AsFeeCollectModuleSettings
  ///
  /// Parent Type: `FeeCollectModuleSettings`
  public struct AsFeeCollectModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = CollectModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FeeCollectModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.CollectModules>.self),
      .field("amount", Amount.self),
      .field("recipient", Lens.EthereumAddress.self),
      .field("referralFee", Double.self),
    ] }

    public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
    public var amount: Amount { __data["amount"] }
    public var recipient: Lens.EthereumAddress { __data["recipient"] }
    public var referralFee: Double { __data["referralFee"] }

    /// AsFeeCollectModuleSettings.Amount
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

      /// AsFeeCollectModuleSettings.Amount.Asset
      ///
      /// Parent Type: `Erc20`
      public struct Asset: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20 }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(Erc20Fields.self),
        ] }

        public var name: String { __data["name"] }
        public var symbol: String { __data["symbol"] }
        public var decimals: Int { __data["decimals"] }
        public var address: Lens.ContractAddress { __data["address"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var erc20Fields: Erc20Fields { _toFragment() }
        }
      }
    }
  }

  /// AsLimitedFeeCollectModuleSettings
  ///
  /// Parent Type: `LimitedFeeCollectModuleSettings`
  public struct AsLimitedFeeCollectModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = CollectModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.LimitedFeeCollectModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.CollectModules>.self),
      .field("collectLimit", String.self),
      .field("amount", Amount.self),
      .field("recipient", Lens.EthereumAddress.self),
      .field("referralFee", Double.self),
    ] }

    public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
    public var collectLimit: String { __data["collectLimit"] }
    public var amount: Amount { __data["amount"] }
    public var recipient: Lens.EthereumAddress { __data["recipient"] }
    public var referralFee: Double { __data["referralFee"] }

    /// AsLimitedFeeCollectModuleSettings.Amount
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

      /// AsLimitedFeeCollectModuleSettings.Amount.Asset
      ///
      /// Parent Type: `Erc20`
      public struct Asset: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20 }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(Erc20Fields.self),
        ] }

        public var name: String { __data["name"] }
        public var symbol: String { __data["symbol"] }
        public var decimals: Int { __data["decimals"] }
        public var address: Lens.ContractAddress { __data["address"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var erc20Fields: Erc20Fields { _toFragment() }
        }
      }
    }
  }

  /// AsLimitedTimedFeeCollectModuleSettings
  ///
  /// Parent Type: `LimitedTimedFeeCollectModuleSettings`
  public struct AsLimitedTimedFeeCollectModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = CollectModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.LimitedTimedFeeCollectModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.CollectModules>.self),
      .field("collectLimit", String.self),
      .field("amount", Amount.self),
      .field("recipient", Lens.EthereumAddress.self),
      .field("referralFee", Double.self),
      .field("endTimestamp", Lens.DateTime.self),
    ] }

    public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
    public var collectLimit: String { __data["collectLimit"] }
    public var amount: Amount { __data["amount"] }
    public var recipient: Lens.EthereumAddress { __data["recipient"] }
    public var referralFee: Double { __data["referralFee"] }
    public var endTimestamp: Lens.DateTime { __data["endTimestamp"] }

    /// AsLimitedTimedFeeCollectModuleSettings.Amount
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

      /// AsLimitedTimedFeeCollectModuleSettings.Amount.Asset
      ///
      /// Parent Type: `Erc20`
      public struct Asset: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20 }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(Erc20Fields.self),
        ] }

        public var name: String { __data["name"] }
        public var symbol: String { __data["symbol"] }
        public var decimals: Int { __data["decimals"] }
        public var address: Lens.ContractAddress { __data["address"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var erc20Fields: Erc20Fields { _toFragment() }
        }
      }
    }
  }

  /// AsRevertCollectModuleSettings
  ///
  /// Parent Type: `RevertCollectModuleSettings`
  public struct AsRevertCollectModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = CollectModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RevertCollectModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.CollectModules>.self),
    ] }

    public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
  }

  /// AsTimedFeeCollectModuleSettings
  ///
  /// Parent Type: `TimedFeeCollectModuleSettings`
  public struct AsTimedFeeCollectModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = CollectModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.TimedFeeCollectModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.CollectModules>.self),
      .field("amount", Amount.self),
      .field("recipient", Lens.EthereumAddress.self),
      .field("referralFee", Double.self),
      .field("endTimestamp", Lens.DateTime.self),
    ] }

    public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
    public var amount: Amount { __data["amount"] }
    public var recipient: Lens.EthereumAddress { __data["recipient"] }
    public var referralFee: Double { __data["referralFee"] }
    public var endTimestamp: Lens.DateTime { __data["endTimestamp"] }

    /// AsTimedFeeCollectModuleSettings.Amount
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

      /// AsTimedFeeCollectModuleSettings.Amount.Asset
      ///
      /// Parent Type: `Erc20`
      public struct Asset: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20 }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(Erc20Fields.self),
        ] }

        public var name: String { __data["name"] }
        public var symbol: String { __data["symbol"] }
        public var decimals: Int { __data["decimals"] }
        public var address: Lens.ContractAddress { __data["address"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var erc20Fields: Erc20Fields { _toFragment() }
        }
      }
    }
  }

  /// AsUnknownCollectModuleSettings
  ///
  /// Parent Type: `UnknownCollectModuleSettings`
  public struct AsUnknownCollectModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = CollectModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.UnknownCollectModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.CollectModules>.self),
      .field("contractAddress", Lens.ContractAddress.self),
      .field("collectModuleReturnData", Lens.CollectModuleData.self),
    ] }

    public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
    public var collectModuleReturnData: Lens.CollectModuleData { __data["collectModuleReturnData"] }
  }
}
