// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct WalletFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment WalletFields on Wallet {
      __typename
      address
      defaultProfile {
        __typename
        ...ProfileFields
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Wallet }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("address", Lens.EthereumAddress.self),
    .field("defaultProfile", DefaultProfile?.self),
  ] }

  public var address: Lens.EthereumAddress { __data["address"] }
  public var defaultProfile: DefaultProfile? { __data["defaultProfile"] }

  /// DefaultProfile
  ///
  /// Parent Type: `Profile`
  public struct DefaultProfile: Lens.SelectionSet {
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

    /// DefaultProfile.Picture
    ///
    /// Parent Type: `ProfileMedia`
    public struct Picture: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

      public var asNftImage: AsNftImage? { _asInlineFragment() }
      public var asMediaSet: AsMediaSet? { _asInlineFragment() }

      /// DefaultProfile.Picture.AsNftImage
      ///
      /// Parent Type: `NftImage`
      public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = WalletFields.DefaultProfile.Picture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.Picture.AsNftImage.self
        ] }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var tokenId: String { __data["tokenId"] }
        public var uri: Lens.Url { __data["uri"] }
        public var verified: Bool { __data["verified"] }
      }

      /// DefaultProfile.Picture.AsMediaSet
      ///
      /// Parent Type: `MediaSet`
      public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = WalletFields.DefaultProfile.Picture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.Picture.AsMediaSet.self
        ] }

        public var original: Original { __data["original"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var small: Small? { __data["small"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var medium: Medium? { __data["medium"] }

        /// DefaultProfile.Picture.AsMediaSet.Original
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

        /// DefaultProfile.Picture.AsMediaSet.Small
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

        /// DefaultProfile.Picture.AsMediaSet.Medium
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

    /// DefaultProfile.CoverPicture
    ///
    /// Parent Type: `ProfileMedia`
    public struct CoverPicture: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

      public var asNftImage: AsNftImage? { _asInlineFragment() }
      public var asMediaSet: AsMediaSet? { _asInlineFragment() }

      /// DefaultProfile.CoverPicture.AsNftImage
      ///
      /// Parent Type: `NftImage`
      public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = WalletFields.DefaultProfile.CoverPicture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.CoverPicture.AsNftImage.self
        ] }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var tokenId: String { __data["tokenId"] }
        public var uri: Lens.Url { __data["uri"] }
        public var verified: Bool { __data["verified"] }
      }

      /// DefaultProfile.CoverPicture.AsMediaSet
      ///
      /// Parent Type: `MediaSet`
      public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = WalletFields.DefaultProfile.CoverPicture
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
          ProfileFields.CoverPicture.AsMediaSet.self
        ] }

        public var original: Original { __data["original"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var small: Small? { __data["small"] }
        @available(*, deprecated, message: "should not be used will always be null")
        public var medium: Medium? { __data["medium"] }

        /// DefaultProfile.CoverPicture.AsMediaSet.Original
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

        /// DefaultProfile.CoverPicture.AsMediaSet.Small
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

        /// DefaultProfile.CoverPicture.AsMediaSet.Medium
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
}
