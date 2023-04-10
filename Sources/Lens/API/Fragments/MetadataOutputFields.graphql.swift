// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct MetadataOutputFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment MetadataOutputFields on MetadataOutput {
      __typename
      name
      description
      content
      media {
        __typename
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
      attributes {
        __typename
        displayType
        traitType
        value
      }
      encryptionParams {
        __typename
        providerSpecificParams {
          __typename
          encryptionKey
        }
        accessCondition {
          __typename
          ...AccessConditionFields
        }
        encryptedFields {
          __typename
          animation_url
          content
          external_url
          image
          media {
            __typename
            ...EncryptedMediaSetFields
          }
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MetadataOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("name", String?.self),
    .field("description", Lens.Markdown?.self),
    .field("content", Lens.Markdown?.self),
    .field("media", [Medium].self),
    .field("attributes", [Attribute].self),
    .field("encryptionParams", EncryptionParams?.self),
  ] }

  public var name: String? { __data["name"] }
  public var description: Lens.Markdown? { __data["description"] }
  public var content: Lens.Markdown? { __data["content"] }
  public var media: [Medium] { __data["media"] }
  public var attributes: [Attribute] { __data["attributes"] }
  public var encryptionParams: EncryptionParams? { __data["encryptionParams"] }

  /// Medium
  ///
  /// Parent Type: `MediaSet`
  public struct Medium: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("original", Original.self),
      .field("small", Small?.self),
      .field("medium", Medium?.self),
    ] }

    public var original: Original { __data["original"] }
    @available(*, deprecated, message: "should not be used will always be null")
    public var small: Small? { __data["small"] }
    @available(*, deprecated, message: "should not be used will always be null")
    public var medium: Medium? { __data["medium"] }

    /// Medium.Original
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

    /// Medium.Small
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

    /// Medium.Medium
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

  /// Attribute
  ///
  /// Parent Type: `MetadataAttributeOutput`
  public struct Attribute: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MetadataAttributeOutput }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("displayType", GraphQLEnum<Lens.PublicationMetadataDisplayTypes>?.self),
      .field("traitType", String?.self),
      .field("value", String?.self),
    ] }

    public var displayType: GraphQLEnum<Lens.PublicationMetadataDisplayTypes>? { __data["displayType"] }
    public var traitType: String? { __data["traitType"] }
    public var value: String? { __data["value"] }
  }

  /// EncryptionParams
  ///
  /// Parent Type: `EncryptionParamsOutput`
  public struct EncryptionParams: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptionParamsOutput }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("providerSpecificParams", ProviderSpecificParams.self),
      .field("accessCondition", AccessCondition.self),
      .field("encryptedFields", EncryptedFields.self),
    ] }

    public var providerSpecificParams: ProviderSpecificParams { __data["providerSpecificParams"] }
    public var accessCondition: AccessCondition { __data["accessCondition"] }
    public var encryptedFields: EncryptedFields { __data["encryptedFields"] }

    /// EncryptionParams.ProviderSpecificParams
    ///
    /// Parent Type: `ProviderSpecificParamsOutput`
    public struct ProviderSpecificParams: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProviderSpecificParamsOutput }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("encryptionKey", Lens.ContentEncryptionKey.self),
      ] }

      public var encryptionKey: Lens.ContentEncryptionKey { __data["encryptionKey"] }
    }

    /// EncryptionParams.AccessCondition
    ///
    /// Parent Type: `AccessConditionOutput`
    public struct AccessCondition: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(AccessConditionFields.self),
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

        public var accessConditionFields: AccessConditionFields { _toFragment() }
        public var simpleConditionFields: SimpleConditionFields { _toFragment() }
        public var booleanConditionFieldsRecursive: BooleanConditionFieldsRecursive { _toFragment() }
      }

      /// EncryptionParams.AccessCondition.Nft
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

      /// EncryptionParams.AccessCondition.Eoa
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

      /// EncryptionParams.AccessCondition.Token
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

      /// EncryptionParams.AccessCondition.Profile
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

      /// EncryptionParams.AccessCondition.Follow
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

      /// EncryptionParams.AccessCondition.Collect
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

    /// EncryptionParams.EncryptedFields
    ///
    /// Parent Type: `EncryptedFieldsOutput`
    public struct EncryptedFields: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedFieldsOutput }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("animation_url", Lens.EncryptedValueScalar?.self),
        .field("content", Lens.EncryptedValueScalar?.self),
        .field("external_url", Lens.EncryptedValueScalar?.self),
        .field("image", Lens.EncryptedValueScalar?.self),
        .field("media", [Medium]?.self),
      ] }

      public var animation_url: Lens.EncryptedValueScalar? { __data["animation_url"] }
      public var content: Lens.EncryptedValueScalar? { __data["content"] }
      public var external_url: Lens.EncryptedValueScalar? { __data["external_url"] }
      public var image: Lens.EncryptedValueScalar? { __data["image"] }
      public var media: [Medium]? { __data["media"] }

      /// EncryptionParams.EncryptedFields.Medium
      ///
      /// Parent Type: `EncryptedMediaSet`
      public struct Medium: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMediaSet }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(EncryptedMediaSetFields.self),
        ] }

        public var original: Original { __data["original"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var small: Small? { __data["small"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var medium: Medium? { __data["medium"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var encryptedMediaSetFields: EncryptedMediaSetFields { _toFragment() }
        }

        /// EncryptionParams.EncryptedFields.Medium.Original
        ///
        /// Parent Type: `EncryptedMedia`
        public struct Original: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMedia }

          public var url: Lens.Url { __data["url"] }
          public var width: Int? { __data["width"] }
          public var height: Int? { __data["height"] }
          public var mimeType: Lens.MimeType? { __data["mimeType"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var encryptedMediaFields: EncryptedMediaFields { _toFragment() }
          }
        }

        /// EncryptionParams.EncryptedFields.Medium.Small
        ///
        /// Parent Type: `EncryptedMedia`
        public struct Small: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMedia }

          public var url: Lens.Url { __data["url"] }
          public var width: Int? { __data["width"] }
          public var height: Int? { __data["height"] }
          public var mimeType: Lens.MimeType? { __data["mimeType"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var encryptedMediaFields: EncryptedMediaFields { _toFragment() }
          }
        }

        /// EncryptionParams.EncryptedFields.Medium.Medium
        ///
        /// Parent Type: `EncryptedMedia`
        public struct Medium: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMedia }

          public var url: Lens.Url { __data["url"] }
          public var width: Int? { __data["width"] }
          public var height: Int? { __data["height"] }
          public var mimeType: Lens.MimeType? { __data["mimeType"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var encryptedMediaFields: EncryptedMediaFields { _toFragment() }
          }
        }
      }
    }
  }
}
