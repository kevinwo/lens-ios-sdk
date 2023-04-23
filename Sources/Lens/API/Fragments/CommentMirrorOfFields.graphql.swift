// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CommentMirrorOfFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment CommentMirrorOfFields on Comment {
      __typename
      ...CommentBaseFields
      mainPost {
        __typename
        ... on Post {
          ...PostFields
        }
        ... on Mirror {
          ...MirrorBaseFields
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Comment }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("mainPost", MainPost.self),
    .fragment(CommentBaseFields.self),
  ] }

  public var mainPost: MainPost { __data["mainPost"] }
  public var id: Lens.InternalPublicationId { __data["id"] }
  public var profile: Profile { __data["profile"] }
  public var stats: Stats { __data["stats"] }
  public var metadata: Metadata { __data["metadata"] }
  public var createdAt: Lens.DateTime { __data["createdAt"] }
  public var collectModule: CommentBaseFields.CollectModule { __data["collectModule"] }
  public var referenceModule: CommentBaseFields.ReferenceModule? { __data["referenceModule"] }
  public var appId: Lens.Sources? { __data["appId"] }
  public var hidden: Bool { __data["hidden"] }
  public var reaction: GraphQLEnum<Lens.ReactionTypes>? { __data["reaction"] }
  public var mirrors: [Lens.InternalPublicationId] { __data["mirrors"] }
  public var hasCollectedByMe: Bool { __data["hasCollectedByMe"] }
  public var isGated: Bool { __data["isGated"] }

  public struct Fragments: FragmentContainer {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public var commentBaseFields: CommentBaseFields { _toFragment() }
  }

  /// MainPost
  ///
  /// Parent Type: `MainPostReference`
  public struct MainPost: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MainPostReference }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .inlineFragment(AsPost.self),
      .inlineFragment(AsMirror.self),
    ] }

    public var asPost: AsPost? { _asInlineFragment() }
    public var asMirror: AsMirror? { _asInlineFragment() }

    /// MainPost.AsPost
    ///
    /// Parent Type: `Post`
    public struct AsPost: Lens.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = CommentMirrorOfFields.MainPost
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
      public static var __selections: [ApolloAPI.Selection] { [
        .fragment(PostFields.self),
      ] }

      public var id: Lens.InternalPublicationId { __data["id"] }
      public var profile: Profile { __data["profile"] }
      public var stats: Stats { __data["stats"] }
      public var metadata: Metadata { __data["metadata"] }
      public var createdAt: Lens.DateTime { __data["createdAt"] }
      public var collectModule: PostFields.CollectModule { __data["collectModule"] }
      public var referenceModule: PostFields.ReferenceModule? { __data["referenceModule"] }
      public var appId: Lens.Sources? { __data["appId"] }
      public var hidden: Bool { __data["hidden"] }
      public var reaction: GraphQLEnum<Lens.ReactionTypes>? { __data["reaction"] }
      public var mirrors: [Lens.InternalPublicationId] { __data["mirrors"] }
      public var hasCollectedByMe: Bool { __data["hasCollectedByMe"] }
      public var isGated: Bool { __data["isGated"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var postFields: PostFields { _toFragment() }
      }

      /// MainPost.AsPost.Profile
      ///
      /// Parent Type: `Profile`
      public struct Profile: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Profile }

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

        /// MainPost.AsPost.Profile.Picture
        ///
        /// Parent Type: `ProfileMedia`
        public struct Picture: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

          public var asNftImage: AsNftImage? { _asInlineFragment() }
          public var asMediaSet: AsMediaSet? { _asInlineFragment() }

          /// MainPost.AsPost.Profile.Picture.AsNftImage
          ///
          /// Parent Type: `NftImage`
          public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsPost.Profile.Picture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.Picture.AsNftImage.self
            ] }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var tokenId: String { __data["tokenId"] }
            public var uri: Lens.Url { __data["uri"] }
            public var verified: Bool { __data["verified"] }
          }

          /// MainPost.AsPost.Profile.Picture.AsMediaSet
          ///
          /// Parent Type: `MediaSet`
          public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsPost.Profile.Picture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.Picture.AsMediaSet.self
            ] }

            public var original: Original { __data["original"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var small: Small? { __data["small"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var medium: Medium? { __data["medium"] }

            /// MainPost.AsPost.Profile.Picture.AsMediaSet.Original
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

            /// MainPost.AsPost.Profile.Picture.AsMediaSet.Small
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

            /// MainPost.AsPost.Profile.Picture.AsMediaSet.Medium
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

        /// MainPost.AsPost.Profile.CoverPicture
        ///
        /// Parent Type: `ProfileMedia`
        public struct CoverPicture: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

          public var asNftImage: AsNftImage? { _asInlineFragment() }
          public var asMediaSet: AsMediaSet? { _asInlineFragment() }

          /// MainPost.AsPost.Profile.CoverPicture.AsNftImage
          ///
          /// Parent Type: `NftImage`
          public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsPost.Profile.CoverPicture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.CoverPicture.AsNftImage.self
            ] }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var tokenId: String { __data["tokenId"] }
            public var uri: Lens.Url { __data["uri"] }
            public var verified: Bool { __data["verified"] }
          }

          /// MainPost.AsPost.Profile.CoverPicture.AsMediaSet
          ///
          /// Parent Type: `MediaSet`
          public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsPost.Profile.CoverPicture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.CoverPicture.AsMediaSet.self
            ] }

            public var original: Original { __data["original"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var small: Small? { __data["small"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var medium: Medium? { __data["medium"] }

            /// MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

            /// MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

            /// MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

      /// MainPost.AsPost.Stats
      ///
      /// Parent Type: `PublicationStats`
      public struct Stats: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

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

      /// MainPost.AsPost.Metadata
      ///
      /// Parent Type: `MetadataOutput`
      public struct Metadata: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MetadataOutput }

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
    }

    /// MainPost.AsMirror
    ///
    /// Parent Type: `Mirror`
    public struct AsMirror: Lens.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = CommentMirrorOfFields.MainPost
      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mirror }
      public static var __selections: [ApolloAPI.Selection] { [
        .fragment(MirrorBaseFields.self),
      ] }

      public var id: Lens.InternalPublicationId { __data["id"] }
      public var profile: Profile { __data["profile"] }
      public var stats: Stats { __data["stats"] }
      public var metadata: Metadata { __data["metadata"] }
      public var createdAt: Lens.DateTime { __data["createdAt"] }
      public var collectModule: MirrorBaseFields.CollectModule { __data["collectModule"] }
      public var referenceModule: MirrorBaseFields.ReferenceModule? { __data["referenceModule"] }
      public var appId: Lens.Sources? { __data["appId"] }
      public var hidden: Bool { __data["hidden"] }
      public var reaction: GraphQLEnum<Lens.ReactionTypes>? { __data["reaction"] }
      public var hasCollectedByMe: Bool { __data["hasCollectedByMe"] }
      public var isGated: Bool { __data["isGated"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var mirrorBaseFields: MirrorBaseFields { _toFragment() }
      }

      /// MainPost.AsMirror.Profile
      ///
      /// Parent Type: `Profile`
      public struct Profile: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Profile }

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

        /// MainPost.AsMirror.Profile.Picture
        ///
        /// Parent Type: `ProfileMedia`
        public struct Picture: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

          public var asNftImage: AsNftImage? { _asInlineFragment() }
          public var asMediaSet: AsMediaSet? { _asInlineFragment() }

          /// MainPost.AsMirror.Profile.Picture.AsNftImage
          ///
          /// Parent Type: `NftImage`
          public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsMirror.Profile.Picture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.Picture.AsNftImage.self
            ] }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var tokenId: String { __data["tokenId"] }
            public var uri: Lens.Url { __data["uri"] }
            public var verified: Bool { __data["verified"] }
          }

          /// MainPost.AsMirror.Profile.Picture.AsMediaSet
          ///
          /// Parent Type: `MediaSet`
          public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsMirror.Profile.Picture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.Picture.AsMediaSet.self
            ] }

            public var original: Original { __data["original"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var small: Small? { __data["small"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var medium: Medium? { __data["medium"] }

            /// MainPost.AsMirror.Profile.Picture.AsMediaSet.Original
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

            /// MainPost.AsMirror.Profile.Picture.AsMediaSet.Small
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

            /// MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium
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

        /// MainPost.AsMirror.Profile.CoverPicture
        ///
        /// Parent Type: `ProfileMedia`
        public struct CoverPicture: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

          public var asNftImage: AsNftImage? { _asInlineFragment() }
          public var asMediaSet: AsMediaSet? { _asInlineFragment() }

          /// MainPost.AsMirror.Profile.CoverPicture.AsNftImage
          ///
          /// Parent Type: `NftImage`
          public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsMirror.Profile.CoverPicture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.CoverPicture.AsNftImage.self
            ] }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var tokenId: String { __data["tokenId"] }
            public var uri: Lens.Url { __data["uri"] }
            public var verified: Bool { __data["verified"] }
          }

          /// MainPost.AsMirror.Profile.CoverPicture.AsMediaSet
          ///
          /// Parent Type: `MediaSet`
          public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CommentMirrorOfFields.MainPost.AsMirror.Profile.CoverPicture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.CoverPicture.AsMediaSet.self
            ] }

            public var original: Original { __data["original"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var small: Small? { __data["small"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var medium: Medium? { __data["medium"] }

            /// MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original
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

            /// MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Small
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

            /// MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Medium
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

      /// MainPost.AsMirror.Stats
      ///
      /// Parent Type: `PublicationStats`
      public struct Stats: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

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

      /// MainPost.AsMirror.Metadata
      ///
      /// Parent Type: `MetadataOutput`
      public struct Metadata: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MetadataOutput }

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
    }
  }
  /// Profile
  ///
  /// Parent Type: `Profile`
  public struct Profile: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Profile }

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

        public typealias RootEntityType = CommentMirrorOfFields.Profile.Picture
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

        public typealias RootEntityType = CommentMirrorOfFields.Profile.Picture
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

        public typealias RootEntityType = CommentMirrorOfFields.Profile.CoverPicture
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

        public typealias RootEntityType = CommentMirrorOfFields.Profile.CoverPicture
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
}
