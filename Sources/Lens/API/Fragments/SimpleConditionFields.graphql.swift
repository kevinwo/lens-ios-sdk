// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct SimpleConditionFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment SimpleConditionFields on AccessConditionOutput {
      __typename
      nft {
        __typename
        ...NftOwnershipFields
      }
      eoa {
        __typename
        ...EoaOwnershipFields
      }
      token {
        __typename
        ...Erc20OwnershipFields
      }
      profile {
        __typename
        ...ProfileOwnershipFields
      }
      follow {
        __typename
        ...FollowConditionFields
      }
      collect {
        __typename
        ...CollectConditionFields
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("nft", Nft?.self),
    .field("eoa", Eoa?.self),
    .field("token", Token?.self),
    .field("profile", Profile?.self),
    .field("follow", Follow?.self),
    .field("collect", Collect?.self),
  ] }

  public var nft: Nft? { __data["nft"] }
  public var eoa: Eoa? { __data["eoa"] }
  public var token: Token? { __data["token"] }
  public var profile: Profile? { __data["profile"] }
  public var follow: Follow? { __data["follow"] }
  public var collect: Collect? { __data["collect"] }

  /// Nft
  ///
  /// Parent Type: `NftOwnershipOutput`
  public struct Nft: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(NftOwnershipFields.self),
    ] }

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
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(EoaOwnershipFields.self),
    ] }

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
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(Erc20OwnershipFields.self),
    ] }

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
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(ProfileOwnershipFields.self),
    ] }

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
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(FollowConditionFields.self),
    ] }

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
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(CollectConditionFields.self),
    ] }

    public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
    public var thisPublication: Bool? { __data["thisPublication"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var collectConditionFields: CollectConditionFields { _toFragment() }
    }
  }
}
