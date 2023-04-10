// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct ProfileFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment ProfileFields on Profile {
      __typename
      id
      name
      bio
      attributes {
        __typename
        displayType
        traitType
        key
        value
      }
      isFollowedByMe
      isFollowing(who: null)
      followNftAddress
      metadata
      isDefault
      handle
      picture {
        __typename
        ... on NftImage {
          contractAddress
          tokenId
          uri
          verified
        }
        ... on MediaSet {
          original {
            __typename
            ...MediaFields
          }
          small {
            __typename
            ...MediaFields
          }
          medium {
            __typename
            ...MediaFields
          }
        }
      }
      coverPicture {
        __typename
        ... on NftImage {
          contractAddress
          tokenId
          uri
          verified
        }
        ... on MediaSet {
          original {
            __typename
            ...MediaFields
          }
          small {
            __typename
            ...MediaFields
          }
          medium {
            __typename
            ...MediaFields
          }
        }
      }
      ownedBy
      dispatcher {
        __typename
        address
        canUseRelay
      }
      stats {
        __typename
        totalFollowers
        totalFollowing
        totalPosts
        totalComments
        totalMirrors
        totalPublications
        totalCollects
      }
      followModule {
        __typename
        ...FollowModuleFields
      }
      onChainIdentity {
        __typename
        ens {
          __typename
          name
        }
        proofOfHumanity
        sybilDotOrg {
          __typename
          verified
          source {
            __typename
            twitter {
              __typename
              handle
            }
          }
        }
        worldcoin {
          __typename
          isHuman
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Profile }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Lens.ProfileId.self),
    .field("name", String?.self),
    .field("bio", String?.self),
    .field("attributes", [Attribute]?.self),
    .field("isFollowedByMe", Bool.self),
    .field("isFollowing", Bool.self, arguments: ["who": .null]),
    .field("followNftAddress", Lens.ContractAddress?.self),
    .field("metadata", Lens.Url?.self),
    .field("isDefault", Bool.self),
    .field("handle", Lens.Handle.self),
    .field("picture", Picture?.self),
    .field("coverPicture", CoverPicture?.self),
    .field("ownedBy", Lens.EthereumAddress.self),
    .field("dispatcher", Dispatcher?.self),
    .field("stats", Stats.self),
    .field("followModule", FollowModule?.self),
    .field("onChainIdentity", OnChainIdentity.self),
  ] }

  public var id: Lens.ProfileId { __data["id"] }
  public var name: String? { __data["name"] }
  public var bio: String? { __data["bio"] }
  public var attributes: [Attribute]? { __data["attributes"] }
  public var isFollowedByMe: Bool { __data["isFollowedByMe"] }
  public var isFollowing: Bool { __data["isFollowing"] }
  public var followNftAddress: Lens.ContractAddress? { __data["followNftAddress"] }
  public var metadata: Lens.Url? { __data["metadata"] }
  public var isDefault: Bool { __data["isDefault"] }
  public var handle: Lens.Handle { __data["handle"] }
  public var picture: Picture? { __data["picture"] }
  public var coverPicture: CoverPicture? { __data["coverPicture"] }
  public var ownedBy: Lens.EthereumAddress { __data["ownedBy"] }
  public var dispatcher: Dispatcher? { __data["dispatcher"] }
  public var stats: Stats { __data["stats"] }
  public var followModule: FollowModule? { __data["followModule"] }
  public var onChainIdentity: OnChainIdentity { __data["onChainIdentity"] }

  /// Attribute
  ///
  /// Parent Type: `Attribute`
  public struct Attribute: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Attribute }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("displayType", String?.self),
      .field("traitType", String?.self),
      .field("key", String.self),
      .field("value", String.self),
    ] }

    public var displayType: String? { __data["displayType"] }
    public var traitType: String? { __data["traitType"] }
    public var key: String { __data["key"] }
    public var value: String { __data["value"] }
  }

  /// Picture
  ///
  /// Parent Type: `ProfileMedia`
  public struct Picture: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .inlineFragment(AsNftImage.self),
      .inlineFragment(AsMediaSet.self),
    ] }

    public var asNftImage: AsNftImage? { _asInlineFragment() }
    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

    /// Picture.AsNftImage
    ///
    /// Parent Type: `NftImage`
    public struct AsNftImage: Lens.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.Picture
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("contractAddress", Lens.ContractAddress.self),
        .field("tokenId", String.self),
        .field("uri", Lens.Url.self),
        .field("verified", Bool.self),
      ] }

      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
      public var tokenId: String { __data["tokenId"] }
      public var uri: Lens.Url { __data["uri"] }
      public var verified: Bool { __data["verified"] }
    }

    /// Picture.AsMediaSet
    ///
    /// Parent Type: `MediaSet`
    public struct AsMediaSet: Lens.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.Picture
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("original", Original.self),
        .field("small", Small?.self),
        .field("medium", Medium?.self),
      ] }

      public var original: Original { __data["original"] }
      @available(*, deprecated, message: "should not be used will always be null")
      public var small: Small? { __data["small"] }
      @available(*, deprecated, message: "should not be used will always be null")
      public var medium: Medium? { __data["medium"] }

      /// Picture.AsMediaSet.Original
      ///
      /// Parent Type: `Media`
      public struct Original: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MediaFields.self),
        ] }

        public var url: Lens.Url { __data["url"] }
        public var width: Int? { __data["width"] }
        public var height: Int? { __data["height"] }
        public var mimeType: Lens.MimeType? { __data["mimeType"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mediaFields: MediaFields { _toFragment() }
        }
      }

      /// Picture.AsMediaSet.Small
      ///
      /// Parent Type: `Media`
      public struct Small: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MediaFields.self),
        ] }

        public var url: Lens.Url { __data["url"] }
        public var width: Int? { __data["width"] }
        public var height: Int? { __data["height"] }
        public var mimeType: Lens.MimeType? { __data["mimeType"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mediaFields: MediaFields { _toFragment() }
        }
      }

      /// Picture.AsMediaSet.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MediaFields.self),
        ] }

        public var url: Lens.Url { __data["url"] }
        public var width: Int? { __data["width"] }
        public var height: Int? { __data["height"] }
        public var mimeType: Lens.MimeType? { __data["mimeType"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mediaFields: MediaFields { _toFragment() }
        }
      }
    }
  }

  /// CoverPicture
  ///
  /// Parent Type: `ProfileMedia`
  public struct CoverPicture: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .inlineFragment(AsNftImage.self),
      .inlineFragment(AsMediaSet.self),
    ] }

    public var asNftImage: AsNftImage? { _asInlineFragment() }
    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

    /// CoverPicture.AsNftImage
    ///
    /// Parent Type: `NftImage`
    public struct AsNftImage: Lens.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.CoverPicture
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("contractAddress", Lens.ContractAddress.self),
        .field("tokenId", String.self),
        .field("uri", Lens.Url.self),
        .field("verified", Bool.self),
      ] }

      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
      public var tokenId: String { __data["tokenId"] }
      public var uri: Lens.Url { __data["uri"] }
      public var verified: Bool { __data["verified"] }
    }

    /// CoverPicture.AsMediaSet
    ///
    /// Parent Type: `MediaSet`
    public struct AsMediaSet: Lens.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.CoverPicture
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("original", Original.self),
        .field("small", Small?.self),
        .field("medium", Medium?.self),
      ] }

      public var original: Original { __data["original"] }
      @available(*, deprecated, message: "should not be used will always be null")
      public var small: Small? { __data["small"] }
      @available(*, deprecated, message: "should not be used will always be null")
      public var medium: Medium? { __data["medium"] }

      /// CoverPicture.AsMediaSet.Original
      ///
      /// Parent Type: `Media`
      public struct Original: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MediaFields.self),
        ] }

        public var url: Lens.Url { __data["url"] }
        public var width: Int? { __data["width"] }
        public var height: Int? { __data["height"] }
        public var mimeType: Lens.MimeType? { __data["mimeType"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mediaFields: MediaFields { _toFragment() }
        }
      }

      /// CoverPicture.AsMediaSet.Small
      ///
      /// Parent Type: `Media`
      public struct Small: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MediaFields.self),
        ] }

        public var url: Lens.Url { __data["url"] }
        public var width: Int? { __data["width"] }
        public var height: Int? { __data["height"] }
        public var mimeType: Lens.MimeType? { __data["mimeType"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mediaFields: MediaFields { _toFragment() }
        }
      }

      /// CoverPicture.AsMediaSet.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MediaFields.self),
        ] }

        public var url: Lens.Url { __data["url"] }
        public var width: Int? { __data["width"] }
        public var height: Int? { __data["height"] }
        public var mimeType: Lens.MimeType? { __data["mimeType"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mediaFields: MediaFields { _toFragment() }
        }
      }
    }
  }

  /// Dispatcher
  ///
  /// Parent Type: `Dispatcher`
  public struct Dispatcher: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Dispatcher }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("address", Lens.EthereumAddress.self),
      .field("canUseRelay", Bool.self),
    ] }

    public var address: Lens.EthereumAddress { __data["address"] }
    public var canUseRelay: Bool { __data["canUseRelay"] }
  }

  /// Stats
  ///
  /// Parent Type: `ProfileStats`
  public struct Stats: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileStats }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("totalFollowers", Int.self),
      .field("totalFollowing", Int.self),
      .field("totalPosts", Int.self),
      .field("totalComments", Int.self),
      .field("totalMirrors", Int.self),
      .field("totalPublications", Int.self),
      .field("totalCollects", Int.self),
    ] }

    public var totalFollowers: Int { __data["totalFollowers"] }
    public var totalFollowing: Int { __data["totalFollowing"] }
    public var totalPosts: Int { __data["totalPosts"] }
    public var totalComments: Int { __data["totalComments"] }
    public var totalMirrors: Int { __data["totalMirrors"] }
    public var totalPublications: Int { __data["totalPublications"] }
    public var totalCollects: Int { __data["totalCollects"] }
  }

  /// FollowModule
  ///
  /// Parent Type: `FollowModule`
  public struct FollowModule: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.FollowModule }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(FollowModuleFields.self),
    ] }

    public var asFeeFollowModuleSettings: AsFeeFollowModuleSettings? { _asInlineFragment() }
    public var asProfileFollowModuleSettings: AsProfileFollowModuleSettings? { _asInlineFragment() }
    public var asRevertFollowModuleSettings: AsRevertFollowModuleSettings? { _asInlineFragment() }
    public var asUnknownFollowModuleSettings: AsUnknownFollowModuleSettings? { _asInlineFragment() }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var followModuleFields: FollowModuleFields { _toFragment() }
    }

    /// FollowModule.AsFeeFollowModuleSettings
    ///
    /// Parent Type: `FeeFollowModuleSettings`
    public struct AsFeeFollowModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.FollowModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FeeFollowModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        ProfileFields.FollowModule.self,
        FollowModuleFields.AsFeeFollowModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
      public var amount: FollowModuleFields.AsFeeFollowModuleSettings.Amount { __data["amount"] }
      public var recipient: Lens.EthereumAddress { __data["recipient"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var followModuleFields: FollowModuleFields { _toFragment() }
      }
    }

    /// FollowModule.AsProfileFollowModuleSettings
    ///
    /// Parent Type: `ProfileFollowModuleSettings`
    public struct AsProfileFollowModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.FollowModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileFollowModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        ProfileFields.FollowModule.self,
        FollowModuleFields.AsProfileFollowModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var followModuleFields: FollowModuleFields { _toFragment() }
      }
    }

    /// FollowModule.AsRevertFollowModuleSettings
    ///
    /// Parent Type: `RevertFollowModuleSettings`
    public struct AsRevertFollowModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.FollowModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RevertFollowModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        ProfileFields.FollowModule.self,
        FollowModuleFields.AsRevertFollowModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var followModuleFields: FollowModuleFields { _toFragment() }
      }
    }

    /// FollowModule.AsUnknownFollowModuleSettings
    ///
    /// Parent Type: `UnknownFollowModuleSettings`
    public struct AsUnknownFollowModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = ProfileFields.FollowModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.UnknownFollowModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        ProfileFields.FollowModule.self,
        FollowModuleFields.AsUnknownFollowModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.FollowModules> { __data["type"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
      public var followModuleReturnData: Lens.FollowModuleData { __data["followModuleReturnData"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var followModuleFields: FollowModuleFields { _toFragment() }
      }
    }
  }

  /// OnChainIdentity
  ///
  /// Parent Type: `OnChainIdentity`
  public struct OnChainIdentity: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.OnChainIdentity }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("ens", Ens?.self),
      .field("proofOfHumanity", Bool.self),
      .field("sybilDotOrg", SybilDotOrg.self),
      .field("worldcoin", Worldcoin.self),
    ] }

    public var ens: Ens? { __data["ens"] }
    public var proofOfHumanity: Bool { __data["proofOfHumanity"] }
    public var sybilDotOrg: SybilDotOrg { __data["sybilDotOrg"] }
    public var worldcoin: Worldcoin { __data["worldcoin"] }

    /// OnChainIdentity.Ens
    ///
    /// Parent Type: `EnsOnChainIdentity`
    public struct Ens: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EnsOnChainIdentity }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", Lens.Ens?.self),
      ] }

      public var name: Lens.Ens? { __data["name"] }
    }

    /// OnChainIdentity.SybilDotOrg
    ///
    /// Parent Type: `SybilDotOrgIdentity`
    public struct SybilDotOrg: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.SybilDotOrgIdentity }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("verified", Bool.self),
        .field("source", Source.self),
      ] }

      public var verified: Bool { __data["verified"] }
      public var source: Source { __data["source"] }

      /// OnChainIdentity.SybilDotOrg.Source
      ///
      /// Parent Type: `SybilDotOrgIdentitySource`
      public struct Source: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.SybilDotOrgIdentitySource }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("twitter", Twitter.self),
        ] }

        public var twitter: Twitter { __data["twitter"] }

        /// OnChainIdentity.SybilDotOrg.Source.Twitter
        ///
        /// Parent Type: `SybilDotOrgTwitterIdentity`
        public struct Twitter: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.SybilDotOrgTwitterIdentity }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("handle", String?.self),
          ] }

          public var handle: String? { __data["handle"] }
        }
      }
    }

    /// OnChainIdentity.Worldcoin
    ///
    /// Parent Type: `WorldcoinIdentity`
    public struct Worldcoin: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.WorldcoinIdentity }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("isHuman", Bool.self),
      ] }

      public var isHuman: Bool { __data["isHuman"] }
    }
  }
}
