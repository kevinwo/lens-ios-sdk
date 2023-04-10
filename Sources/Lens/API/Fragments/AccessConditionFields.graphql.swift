// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct AccessConditionFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment AccessConditionFields on AccessConditionOutput {
      __typename
      ...SimpleConditionFields
      ...BooleanConditionFieldsRecursive
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .fragment(SimpleConditionFields.self),
    .fragment(BooleanConditionFieldsRecursive.self),
  ] }

  public var nft: Nft? { __data["nft"] }
  public var eoa: Eoa? { __data["eoa"] }
  public var token: Token? { __data["token"] }
  public var profile: Profile? { __data["profile"] }
  public var follow: Follow? { __data["follow"] }
  public var collect: Collect? { __data["collect"] }
  public var and: BooleanConditionFieldsRecursive.And? { __data["and"] }
  public var or: BooleanConditionFieldsRecursive.Or? { __data["or"] }

  public struct Fragments: FragmentContainer {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public var simpleConditionFields: SimpleConditionFields { _toFragment() }
    public var booleanConditionFieldsRecursive: BooleanConditionFieldsRecursive { _toFragment() }
  }

  /// Nft
  ///
  /// Parent Type: `NftOwnershipOutput`
  public struct Nft: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }

    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
    public var chainID: Lens.ChainId { __data["chainID"] }
    public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
    public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var nftOwnershipFields: NftOwnershipFields { _toFragment() }
    }
  }

  /// Eoa
  ///
  /// Parent Type: `EoaOwnershipOutput`
  public struct Eoa: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }

    public var address: Lens.EthereumAddress { __data["address"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var eoaOwnershipFields: EoaOwnershipFields { _toFragment() }
    }
  }

  /// Token
  ///
  /// Parent Type: `Erc20OwnershipOutput`
  public struct Token: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }

    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
    public var amount: String { __data["amount"] }
    public var chainID: Lens.ChainId { __data["chainID"] }
    public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
    public var decimals: Double { __data["decimals"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var erc20OwnershipFields: Erc20OwnershipFields { _toFragment() }
    }
  }

  /// Profile
  ///
  /// Parent Type: `ProfileOwnershipOutput`
  public struct Profile: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileOwnershipOutput }

    public var profileId: Lens.ProfileId { __data["profileId"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var profileOwnershipFields: ProfileOwnershipFields { _toFragment() }
    }
  }

  /// Follow
  ///
  /// Parent Type: `FollowConditionOutput`
  public struct Follow: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }

    public var profileId: Lens.ProfileId { __data["profileId"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var followConditionFields: FollowConditionFields { _toFragment() }
    }
  }

  /// Collect
  ///
  /// Parent Type: `CollectConditionOutput`
  public struct Collect: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }

    public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
    public var thisPublication: Bool? { __data["thisPublication"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var collectConditionFields: CollectConditionFields { _toFragment() }
    }
  }
}
