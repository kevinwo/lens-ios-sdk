// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct MirrorBaseFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment MirrorBaseFields on Mirror {
      __typename
      id
      profile {
        __typename
        ...ProfileFields
      }
      stats {
        __typename
        ...PublicationStatsFields
      }
      metadata {
        __typename
        ...MetadataOutputFields
      }
      createdAt
      collectModule {
        __typename
        ...CollectModuleFields
      }
      referenceModule {
        __typename
        ...ReferenceModuleFields
      }
      appId
      hidden
      reaction(request: {profileId: $observerId})
      hasCollectedByMe
      isGated
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mirror }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Lens.InternalPublicationId.self),
    .field("profile", Profile.self),
    .field("stats", Stats.self),
    .field("metadata", Metadata.self),
    .field("createdAt", Lens.DateTime.self),
    .field("collectModule", CollectModule.self),
    .field("referenceModule", ReferenceModule?.self),
    .field("appId", Lens.Sources?.self),
    .field("hidden", Bool.self),
    .field("reaction", GraphQLEnum<Lens.ReactionTypes>?.self, arguments: ["request": ["profileId": .variable("observerId")]]),
    .field("hasCollectedByMe", Bool.self),
    .field("isGated", Bool.self),
  ] }

  public var id: Lens.InternalPublicationId { __data["id"] }
  public var profile: Profile { __data["profile"] }
  public var stats: Stats { __data["stats"] }
  public var metadata: Metadata { __data["metadata"] }
  public var createdAt: Lens.DateTime { __data["createdAt"] }
  public var collectModule: CollectModule { __data["collectModule"] }
  public var referenceModule: ReferenceModule? { __data["referenceModule"] }
  public var appId: Lens.Sources? { __data["appId"] }
  public var hidden: Bool { __data["hidden"] }
  public var reaction: GraphQLEnum<Lens.ReactionTypes>? { __data["reaction"] }
  public var hasCollectedByMe: Bool { __data["hasCollectedByMe"] }
  public var isGated: Bool { __data["isGated"] }

  /// Profile
  ///
  /// Parent Type: `Profile`
  public struct Profile: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Profile }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(ProfileFields.self),
    ] }

    public var id: Lens.ProfileId { __data["id"] }
    public var name: String? { __data["name"] }
    public var bio: String? { __data["bio"] }
    public var attributes: [ProfileFields.Attribute]? { __data["attributes"] }
    public var isFollowedByMe: Bool { __data["isFollowedByMe"] }
    public var isFollowing: Bool { __data["isFollowing"] }
    public var followNftAddress: Lens.ContractAddress? { __data["followNftAddress"] }
    public var metadata: Lens.Url? { __data["metadata"] }
    public var isDefault: Bool { __data["isDefault"] }
    public var handle: Lens.Handle { __data["handle"] }
    public var picture: Picture? { __data["picture"] }
    public var coverPicture: CoverPicture? { __data["coverPicture"] }
    public var ownedBy: Lens.EthereumAddress { __data["ownedBy"] }
    public var dispatcher: ProfileFields.Dispatcher? { __data["dispatcher"] }
    public var stats: ProfileFields.Stats { __data["stats"] }
    public var followModule: ProfileFields.FollowModule? { __data["followModule"] }
    public var onChainIdentity: ProfileFields.OnChainIdentity { __data["onChainIdentity"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var profileFields: ProfileFields { _toFragment() }
    }

    /// Profile.Picture
    ///
    /// Parent Type: `ProfileMedia`
    public struct Picture: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

      public var asNftImage: AsNftImage? { _asInlineFragment() }
      public var asMediaSet: AsMediaSet? { _asInlineFragment() }

      /// Profile.Picture.AsNftImage
      ///
      /// Parent Type: `NftImage`
      public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = MirrorBaseFields.Profile.Picture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.Picture.AsNftImage.self
        ] }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var tokenId: String { __data["tokenId"] }
        public var uri: Lens.Url { __data["uri"] }
        public var verified: Bool { __data["verified"] }
      }

      /// Profile.Picture.AsMediaSet
      ///
      /// Parent Type: `MediaSet`
      public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = MirrorBaseFields.Profile.Picture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.Picture.AsMediaSet.self
        ] }

        public var original: Original { __data["original"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var small: Small? { __data["small"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var medium: Medium? { __data["medium"] }

        /// Profile.Picture.AsMediaSet.Original
        ///
        /// Parent Type: `Media`
        public struct Original: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }

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

        /// Profile.Picture.AsMediaSet.Small
        ///
        /// Parent Type: `Media`
        public struct Small: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }

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

        /// Profile.Picture.AsMediaSet.Medium
        ///
        /// Parent Type: `Media`
        public struct Medium: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }

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

    /// Profile.CoverPicture
    ///
    /// Parent Type: `ProfileMedia`
    public struct CoverPicture: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

      public var asNftImage: AsNftImage? { _asInlineFragment() }
      public var asMediaSet: AsMediaSet? { _asInlineFragment() }

      /// Profile.CoverPicture.AsNftImage
      ///
      /// Parent Type: `NftImage`
      public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = MirrorBaseFields.Profile.CoverPicture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.CoverPicture.AsNftImage.self
        ] }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var tokenId: String { __data["tokenId"] }
        public var uri: Lens.Url { __data["uri"] }
        public var verified: Bool { __data["verified"] }
      }

      /// Profile.CoverPicture.AsMediaSet
      ///
      /// Parent Type: `MediaSet`
      public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = MirrorBaseFields.Profile.CoverPicture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.CoverPicture.AsMediaSet.self
        ] }

        public var original: Original { __data["original"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var small: Small? { __data["small"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var medium: Medium? { __data["medium"] }

        /// Profile.CoverPicture.AsMediaSet.Original
        ///
        /// Parent Type: `Media`
        public struct Original: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }

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

        /// Profile.CoverPicture.AsMediaSet.Small
        ///
        /// Parent Type: `Media`
        public struct Small: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }

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

        /// Profile.CoverPicture.AsMediaSet.Medium
        ///
        /// Parent Type: `Media`
        public struct Medium: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }

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
  }

  /// Stats
  ///
  /// Parent Type: `PublicationStats`
  public struct Stats: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(PublicationStatsFields.self),
    ] }

    public var totalUpvotes: Int { __data["totalUpvotes"] }
    public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
    public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
    public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var publicationStatsFields: PublicationStatsFields { _toFragment() }
    }
  }

  /// Metadata
  ///
  /// Parent Type: `MetadataOutput`
  public struct Metadata: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MetadataOutput }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(MetadataOutputFields.self),
    ] }

    public var name: String? { __data["name"] }
    public var description: Lens.Markdown? { __data["description"] }
    public var content: Lens.Markdown? { __data["content"] }
    public var media: [MetadataOutputFields.Medium] { __data["media"] }
    public var attributes: [MetadataOutputFields.Attribute] { __data["attributes"] }
    public var encryptionParams: MetadataOutputFields.EncryptionParams? { __data["encryptionParams"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var metadataOutputFields: MetadataOutputFields { _toFragment() }
    }
  }

  /// CollectModule
  ///
  /// Parent Type: `CollectModule`
  public struct CollectModule: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.CollectModule }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(CollectModuleFields.self),
    ] }

    public var asFreeCollectModuleSettings: AsFreeCollectModuleSettings? { _asInlineFragment() }
    public var asFeeCollectModuleSettings: AsFeeCollectModuleSettings? { _asInlineFragment() }
    public var asLimitedFeeCollectModuleSettings: AsLimitedFeeCollectModuleSettings? { _asInlineFragment() }
    public var asLimitedTimedFeeCollectModuleSettings: AsLimitedTimedFeeCollectModuleSettings? { _asInlineFragment() }
    public var asRevertCollectModuleSettings: AsRevertCollectModuleSettings? { _asInlineFragment() }
    public var asTimedFeeCollectModuleSettings: AsTimedFeeCollectModuleSettings? { _asInlineFragment() }
    public var asUnknownCollectModuleSettings: AsUnknownCollectModuleSettings? { _asInlineFragment() }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var collectModuleFields: CollectModuleFields { _toFragment() }
    }

    /// CollectModule.AsFreeCollectModuleSettings
    ///
    /// Parent Type: `FreeCollectModuleSettings`
    public struct AsFreeCollectModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.CollectModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FreeCollectModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.CollectModule.self,
        CollectModuleFields.AsFreeCollectModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
      public var followerOnly: Bool { __data["followerOnly"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var collectModuleFields: CollectModuleFields { _toFragment() }
      }
    }

    /// CollectModule.AsFeeCollectModuleSettings
    ///
    /// Parent Type: `FeeCollectModuleSettings`
    public struct AsFeeCollectModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.CollectModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FeeCollectModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.CollectModule.self,
        CollectModuleFields.AsFeeCollectModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
      public var amount: CollectModuleFields.AsFeeCollectModuleSettings.Amount { __data["amount"] }
      public var recipient: Lens.EthereumAddress { __data["recipient"] }
      public var referralFee: Double { __data["referralFee"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var collectModuleFields: CollectModuleFields { _toFragment() }
      }
    }

    /// CollectModule.AsLimitedFeeCollectModuleSettings
    ///
    /// Parent Type: `LimitedFeeCollectModuleSettings`
    public struct AsLimitedFeeCollectModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.CollectModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.LimitedFeeCollectModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.CollectModule.self,
        CollectModuleFields.AsLimitedFeeCollectModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
      public var collectLimit: String { __data["collectLimit"] }
      public var amount: CollectModuleFields.AsLimitedFeeCollectModuleSettings.Amount { __data["amount"] }
      public var recipient: Lens.EthereumAddress { __data["recipient"] }
      public var referralFee: Double { __data["referralFee"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var collectModuleFields: CollectModuleFields { _toFragment() }
      }
    }

    /// CollectModule.AsLimitedTimedFeeCollectModuleSettings
    ///
    /// Parent Type: `LimitedTimedFeeCollectModuleSettings`
    public struct AsLimitedTimedFeeCollectModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.CollectModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.LimitedTimedFeeCollectModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.CollectModule.self,
        CollectModuleFields.AsLimitedTimedFeeCollectModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
      public var collectLimit: String { __data["collectLimit"] }
      public var amount: CollectModuleFields.AsLimitedTimedFeeCollectModuleSettings.Amount { __data["amount"] }
      public var recipient: Lens.EthereumAddress { __data["recipient"] }
      public var referralFee: Double { __data["referralFee"] }
      public var endTimestamp: Lens.DateTime { __data["endTimestamp"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var collectModuleFields: CollectModuleFields { _toFragment() }
      }
    }

    /// CollectModule.AsRevertCollectModuleSettings
    ///
    /// Parent Type: `RevertCollectModuleSettings`
    public struct AsRevertCollectModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.CollectModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RevertCollectModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.CollectModule.self,
        CollectModuleFields.AsRevertCollectModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var collectModuleFields: CollectModuleFields { _toFragment() }
      }
    }

    /// CollectModule.AsTimedFeeCollectModuleSettings
    ///
    /// Parent Type: `TimedFeeCollectModuleSettings`
    public struct AsTimedFeeCollectModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.CollectModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.TimedFeeCollectModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.CollectModule.self,
        CollectModuleFields.AsTimedFeeCollectModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
      public var amount: CollectModuleFields.AsTimedFeeCollectModuleSettings.Amount { __data["amount"] }
      public var recipient: Lens.EthereumAddress { __data["recipient"] }
      public var referralFee: Double { __data["referralFee"] }
      public var endTimestamp: Lens.DateTime { __data["endTimestamp"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var collectModuleFields: CollectModuleFields { _toFragment() }
      }
    }

    /// CollectModule.AsUnknownCollectModuleSettings
    ///
    /// Parent Type: `UnknownCollectModuleSettings`
    public struct AsUnknownCollectModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.CollectModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.UnknownCollectModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.CollectModule.self,
        CollectModuleFields.AsUnknownCollectModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.CollectModules> { __data["type"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
      public var collectModuleReturnData: Lens.CollectModuleData { __data["collectModuleReturnData"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var collectModuleFields: CollectModuleFields { _toFragment() }
      }
    }
  }

  /// ReferenceModule
  ///
  /// Parent Type: `ReferenceModule`
  public struct ReferenceModule: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ReferenceModule }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(ReferenceModuleFields.self),
    ] }

    public var asFollowOnlyReferenceModuleSettings: AsFollowOnlyReferenceModuleSettings? { _asInlineFragment() }
    public var asUnknownReferenceModuleSettings: AsUnknownReferenceModuleSettings? { _asInlineFragment() }
    public var asDegreesOfSeparationReferenceModuleSettings: AsDegreesOfSeparationReferenceModuleSettings? { _asInlineFragment() }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var referenceModuleFields: ReferenceModuleFields { _toFragment() }
    }

    /// ReferenceModule.AsFollowOnlyReferenceModuleSettings
    ///
    /// Parent Type: `FollowOnlyReferenceModuleSettings`
    public struct AsFollowOnlyReferenceModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.ReferenceModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowOnlyReferenceModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.ReferenceModule.self,
        ReferenceModuleFields.AsFollowOnlyReferenceModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.ReferenceModules> { __data["type"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var referenceModuleFields: ReferenceModuleFields { _toFragment() }
      }
    }

    /// ReferenceModule.AsUnknownReferenceModuleSettings
    ///
    /// Parent Type: `UnknownReferenceModuleSettings`
    public struct AsUnknownReferenceModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.ReferenceModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.UnknownReferenceModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.ReferenceModule.self,
        ReferenceModuleFields.AsUnknownReferenceModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.ReferenceModules> { __data["type"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
      public var referenceModuleReturnData: Lens.ReferenceModuleData { __data["referenceModuleReturnData"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var referenceModuleFields: ReferenceModuleFields { _toFragment() }
      }
    }

    /// ReferenceModule.AsDegreesOfSeparationReferenceModuleSettings
    ///
    /// Parent Type: `DegreesOfSeparationReferenceModuleSettings`
    public struct AsDegreesOfSeparationReferenceModuleSettings: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = MirrorBaseFields.ReferenceModule
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.DegreesOfSeparationReferenceModuleSettings }
      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
        MirrorBaseFields.ReferenceModule.self,
        ReferenceModuleFields.AsDegreesOfSeparationReferenceModuleSettings.self
      ] }

      public var type: GraphQLEnum<Lens.ReferenceModules> { __data["type"] }
      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
      public var commentsRestricted: Bool { __data["commentsRestricted"] }
      public var mirrorsRestricted: Bool { __data["mirrorsRestricted"] }
      public var degreesOfSeparation: Int { __data["degreesOfSeparation"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var referenceModuleFields: ReferenceModuleFields { _toFragment() }
      }
    }
  }
}
