// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PublicationQuery: GraphQLQuery {
  public static let operationName: String = "publication"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query publication($request: PublicationQueryRequest!) {
        publication(request: $request) {
          __typename
          ... on Post {
            ...PostFields
          }
          ... on Comment {
            ...CommentFields
          }
          ... on Mirror {
            ...MirrorFields
          }
        }
      }
      """#,
      fragments: [PostFields.self, ProfileFields.self, MediaFields.self, FollowModuleFields.self, PublicationStatsFields.self, MetadataOutputFields.self, AccessConditionFields.self, SimpleConditionFields.self, NftOwnershipFields.self, EoaOwnershipFields.self, Erc20OwnershipFields.self, ProfileOwnershipFields.self, FollowConditionFields.self, CollectConditionFields.self, BooleanConditionFieldsRecursive.self, EncryptedMediaSetFields.self, EncryptedMediaFields.self, CollectModuleFields.self, Erc20Fields.self, ReferenceModuleFields.self, CommentFields.self, CommentBaseFields.self, MirrorBaseFields.self, CommentMirrorOfFields.self, MirrorFields.self]
    ))

  public var request: PublicationQueryRequest

  public init(request: PublicationQueryRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("publication", Publication?.self, arguments: ["request": .variable("request")]),
    ] }

    public var publication: Publication? { __data["publication"] }

    /// Publication
    ///
    /// Parent Type: `Publication`
    public struct Publication: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Unions.Publication }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsPost.self),
        .inlineFragment(AsComment.self),
        .inlineFragment(AsMirror.self),
      ] }

      public var asPost: AsPost? { _asInlineFragment() }
      public var asComment: AsComment? { _asInlineFragment() }
      public var asMirror: AsMirror? { _asInlineFragment() }

      /// Publication.AsPost
      ///
      /// Parent Type: `Post`
      public struct AsPost: Lens.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = Publication
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

        /// Publication.AsPost.Profile
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

          /// Publication.AsPost.Profile.Picture
          ///
          /// Parent Type: `ProfileMedia`
          public struct Picture: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

            public var asNftImage: AsNftImage? { _asInlineFragment() }
            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

            /// Publication.AsPost.Profile.Picture.AsNftImage
            ///
            /// Parent Type: `NftImage`
            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsPost.Profile.Picture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.Picture.AsNftImage.self
              ] }

              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
              public var tokenId: String { __data["tokenId"] }
              public var uri: Lens.Url { __data["uri"] }
              public var verified: Bool { __data["verified"] }
            }

            /// Publication.AsPost.Profile.Picture.AsMediaSet
            ///
            /// Parent Type: `MediaSet`
            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsPost.Profile.Picture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.Picture.AsMediaSet.self
              ] }

              public var original: Original { __data["original"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var small: Small? { __data["small"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var medium: Medium? { __data["medium"] }

              /// Publication.AsPost.Profile.Picture.AsMediaSet.Original
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

              /// Publication.AsPost.Profile.Picture.AsMediaSet.Small
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

              /// Publication.AsPost.Profile.Picture.AsMediaSet.Medium
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

          /// Publication.AsPost.Profile.CoverPicture
          ///
          /// Parent Type: `ProfileMedia`
          public struct CoverPicture: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

            public var asNftImage: AsNftImage? { _asInlineFragment() }
            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

            /// Publication.AsPost.Profile.CoverPicture.AsNftImage
            ///
            /// Parent Type: `NftImage`
            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsPost.Profile.CoverPicture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.CoverPicture.AsNftImage.self
              ] }

              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
              public var tokenId: String { __data["tokenId"] }
              public var uri: Lens.Url { __data["uri"] }
              public var verified: Bool { __data["verified"] }
            }

            /// Publication.AsPost.Profile.CoverPicture.AsMediaSet
            ///
            /// Parent Type: `MediaSet`
            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsPost.Profile.CoverPicture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.CoverPicture.AsMediaSet.self
              ] }

              public var original: Original { __data["original"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var small: Small? { __data["small"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var medium: Medium? { __data["medium"] }

              /// Publication.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

              /// Publication.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

              /// Publication.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

        /// Publication.AsPost.Stats
        ///
        /// Parent Type: `PublicationStats`
        public struct Stats: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

          public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
          public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
          public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var publicationStatsFields: PublicationStatsFields { _toFragment() }
          }
        }

        /// Publication.AsPost.Metadata
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

      /// Publication.AsComment
      ///
      /// Parent Type: `Comment`
      public struct AsComment: Lens.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = Publication
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Comment }
        public static var __selections: [ApolloAPI.Selection] { [
          .fragment(CommentFields.self),
        ] }

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
        public var mainPost: MainPost { __data["mainPost"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var commentFields: CommentFields { _toFragment() }
          public var commentBaseFields: CommentBaseFields { _toFragment() }
        }

        /// Publication.AsComment.Profile
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

          /// Publication.AsComment.Profile.Picture
          ///
          /// Parent Type: `ProfileMedia`
          public struct Picture: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

            public var asNftImage: AsNftImage? { _asInlineFragment() }
            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

            /// Publication.AsComment.Profile.Picture.AsNftImage
            ///
            /// Parent Type: `NftImage`
            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsComment.Profile.Picture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.Picture.AsNftImage.self
              ] }

              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
              public var tokenId: String { __data["tokenId"] }
              public var uri: Lens.Url { __data["uri"] }
              public var verified: Bool { __data["verified"] }
            }

            /// Publication.AsComment.Profile.Picture.AsMediaSet
            ///
            /// Parent Type: `MediaSet`
            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsComment.Profile.Picture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.Picture.AsMediaSet.self
              ] }

              public var original: Original { __data["original"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var small: Small? { __data["small"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var medium: Medium? { __data["medium"] }

              /// Publication.AsComment.Profile.Picture.AsMediaSet.Original
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

              /// Publication.AsComment.Profile.Picture.AsMediaSet.Small
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

              /// Publication.AsComment.Profile.Picture.AsMediaSet.Medium
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

          /// Publication.AsComment.Profile.CoverPicture
          ///
          /// Parent Type: `ProfileMedia`
          public struct CoverPicture: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

            public var asNftImage: AsNftImage? { _asInlineFragment() }
            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

            /// Publication.AsComment.Profile.CoverPicture.AsNftImage
            ///
            /// Parent Type: `NftImage`
            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsComment.Profile.CoverPicture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.CoverPicture.AsNftImage.self
              ] }

              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
              public var tokenId: String { __data["tokenId"] }
              public var uri: Lens.Url { __data["uri"] }
              public var verified: Bool { __data["verified"] }
            }

            /// Publication.AsComment.Profile.CoverPicture.AsMediaSet
            ///
            /// Parent Type: `MediaSet`
            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsComment.Profile.CoverPicture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.CoverPicture.AsMediaSet.self
              ] }

              public var original: Original { __data["original"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var small: Small? { __data["small"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var medium: Medium? { __data["medium"] }

              /// Publication.AsComment.Profile.CoverPicture.AsMediaSet.Original
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

              /// Publication.AsComment.Profile.CoverPicture.AsMediaSet.Small
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

              /// Publication.AsComment.Profile.CoverPicture.AsMediaSet.Medium
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

        /// Publication.AsComment.Stats
        ///
        /// Parent Type: `PublicationStats`
        public struct Stats: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

          public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
          public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
          public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var publicationStatsFields: PublicationStatsFields { _toFragment() }
          }
        }

        /// Publication.AsComment.Metadata
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

        /// Publication.AsComment.MainPost
        ///
        /// Parent Type: `MainPostReference`
        public struct MainPost: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MainPostReference }

          public var asPost: AsPost? { _asInlineFragment() }
          public var asMirror: AsMirror? { _asInlineFragment() }

          /// Publication.AsComment.MainPost.AsPost
          ///
          /// Parent Type: `Post`
          public struct AsPost: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Publication.AsComment.MainPost
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              PostFields.self,
              CommentFields.MainPost.AsPost.self
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

            /// Publication.AsComment.MainPost.AsPost.Profile
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

              /// Publication.AsComment.MainPost.AsPost.Profile.Picture
              ///
              /// Parent Type: `ProfileMedia`
              public struct Picture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsComment.MainPost.AsPost.Profile.Picture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsPost.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsPost.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original
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

                  /// Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Small
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

                  /// Publication.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium
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

              /// Publication.AsComment.MainPost.AsPost.Profile.CoverPicture
              ///
              /// Parent Type: `ProfileMedia`
              public struct CoverPicture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsComment.MainPost.AsPost.Profile.CoverPicture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsPost.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsPost.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

                  /// Publication.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

                  /// Publication.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

            /// Publication.AsComment.MainPost.AsPost.Stats
            ///
            /// Parent Type: `PublicationStats`
            public struct Stats: Lens.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

              public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
              public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
              public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

              public struct Fragments: FragmentContainer {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public var publicationStatsFields: PublicationStatsFields { _toFragment() }
              }
            }

            /// Publication.AsComment.MainPost.AsPost.Metadata
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

          /// Publication.AsComment.MainPost.AsMirror
          ///
          /// Parent Type: `Mirror`
          public struct AsMirror: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Publication.AsComment.MainPost
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mirror }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              MirrorBaseFields.self,
              CommentFields.MainPost.AsMirror.self
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
            public var mirrorOf: MirrorOf { __data["mirrorOf"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var mirrorBaseFields: MirrorBaseFields { _toFragment() }
            }

            /// Publication.AsComment.MainPost.AsMirror.Profile
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

              /// Publication.AsComment.MainPost.AsMirror.Profile.Picture
              ///
              /// Parent Type: `ProfileMedia`
              public struct Picture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original
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

                  /// Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Small
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

                  /// Publication.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium
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

              /// Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture
              ///
              /// Parent Type: `ProfileMedia`
              public struct CoverPicture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original
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

                  /// Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Small
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

                  /// Publication.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Medium
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

            /// Publication.AsComment.MainPost.AsMirror.Stats
            ///
            /// Parent Type: `PublicationStats`
            public struct Stats: Lens.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

              public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
              public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
              public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

              public struct Fragments: FragmentContainer {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public var publicationStatsFields: PublicationStatsFields { _toFragment() }
              }
            }

            /// Publication.AsComment.MainPost.AsMirror.Metadata
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

            /// Publication.AsComment.MainPost.AsMirror.MirrorOf
            ///
            /// Parent Type: `MirrorablePublication`
            public struct MirrorOf: Lens.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MirrorablePublication }

              public var asPost: AsPost? { _asInlineFragment() }
              public var asComment: AsComment? { _asInlineFragment() }

              /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost
              ///
              /// Parent Type: `Post`
              public struct AsPost: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf
                public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
                public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                  PostFields.self,
                  CommentFields.MainPost.AsMirror.MirrorOf.AsPost.self
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

                /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile
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

                  /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct Picture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Original
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Small
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Medium
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

                  /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct CoverPicture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

                /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Stats
                ///
                /// Parent Type: `PublicationStats`
                public struct Stats: Lens.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                  public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                  public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                  public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                  public struct Fragments: FragmentContainer {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                  }
                }

                /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Metadata
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

              /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment
              ///
              /// Parent Type: `Comment`
              public struct AsComment: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf
                public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Comment }
                public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                  CommentBaseFields.self,
                  CommentMirrorOfFields.self,
                  CommentFields.MainPost.AsMirror.MirrorOf.AsComment.self
                ] }

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
                public var mainPost: MainPost { __data["mainPost"] }

                public struct Fragments: FragmentContainer {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public var commentBaseFields: CommentBaseFields { _toFragment() }
                  public var commentMirrorOfFields: CommentMirrorOfFields { _toFragment() }
                }

                /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile
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

                  /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct Picture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Original
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Small
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Medium
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

                  /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct CoverPicture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Original
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Small
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Medium
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

                /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Stats
                ///
                /// Parent Type: `PublicationStats`
                public struct Stats: Lens.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                  public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                  public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                  public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                  public struct Fragments: FragmentContainer {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                  }
                }

                /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Metadata
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

                /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost
                ///
                /// Parent Type: `MainPostReference`
                public struct MainPost: Lens.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MainPostReference }

                  public var asPost: AsPost? { _asInlineFragment() }
                  public var asMirror: AsMirror? { _asInlineFragment() }

                  /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost
                  ///
                  /// Parent Type: `Post`
                  public struct AsPost: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost
                    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
                    public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                      PostFields.self,
                      CommentMirrorOfFields.MainPost.AsPost.self
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

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct Picture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Small
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct CoverPicture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Stats
                    ///
                    /// Parent Type: `PublicationStats`
                    public struct Stats: Lens.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                      public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                      public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                      public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                      public struct Fragments: FragmentContainer {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                      }
                    }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Metadata
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

                  /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror
                  ///
                  /// Parent Type: `Mirror`
                  public struct AsMirror: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost
                    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mirror }
                    public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                      MirrorBaseFields.self,
                      CommentMirrorOfFields.MainPost.AsMirror.self
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

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct Picture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Small
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium
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

                      /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct CoverPicture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Small
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

                          /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Medium
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

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Stats
                    ///
                    /// Parent Type: `PublicationStats`
                    public struct Stats: Lens.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                      public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                      public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                      public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                      public struct Fragments: FragmentContainer {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                      }
                    }

                    /// Publication.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Metadata
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
              }
            }
          }
        }
      }

      /// Publication.AsMirror
      ///
      /// Parent Type: `Mirror`
      public struct AsMirror: Lens.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = Publication
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mirror }
        public static var __selections: [ApolloAPI.Selection] { [
          .fragment(MirrorFields.self),
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
        public var mirrorOf: MirrorOf { __data["mirrorOf"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mirrorFields: MirrorFields { _toFragment() }
          public var mirrorBaseFields: MirrorBaseFields { _toFragment() }
        }

        /// Publication.AsMirror.Profile
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

          /// Publication.AsMirror.Profile.Picture
          ///
          /// Parent Type: `ProfileMedia`
          public struct Picture: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

            public var asNftImage: AsNftImage? { _asInlineFragment() }
            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

            /// Publication.AsMirror.Profile.Picture.AsNftImage
            ///
            /// Parent Type: `NftImage`
            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsMirror.Profile.Picture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.Picture.AsNftImage.self
              ] }

              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
              public var tokenId: String { __data["tokenId"] }
              public var uri: Lens.Url { __data["uri"] }
              public var verified: Bool { __data["verified"] }
            }

            /// Publication.AsMirror.Profile.Picture.AsMediaSet
            ///
            /// Parent Type: `MediaSet`
            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsMirror.Profile.Picture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.Picture.AsMediaSet.self
              ] }

              public var original: Original { __data["original"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var small: Small? { __data["small"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var medium: Medium? { __data["medium"] }

              /// Publication.AsMirror.Profile.Picture.AsMediaSet.Original
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

              /// Publication.AsMirror.Profile.Picture.AsMediaSet.Small
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

              /// Publication.AsMirror.Profile.Picture.AsMediaSet.Medium
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

          /// Publication.AsMirror.Profile.CoverPicture
          ///
          /// Parent Type: `ProfileMedia`
          public struct CoverPicture: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

            public var asNftImage: AsNftImage? { _asInlineFragment() }
            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

            /// Publication.AsMirror.Profile.CoverPicture.AsNftImage
            ///
            /// Parent Type: `NftImage`
            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsMirror.Profile.CoverPicture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.CoverPicture.AsNftImage.self
              ] }

              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
              public var tokenId: String { __data["tokenId"] }
              public var uri: Lens.Url { __data["uri"] }
              public var verified: Bool { __data["verified"] }
            }

            /// Publication.AsMirror.Profile.CoverPicture.AsMediaSet
            ///
            /// Parent Type: `MediaSet`
            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = Publication.AsMirror.Profile.CoverPicture
              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                ProfileFields.CoverPicture.AsMediaSet.self
              ] }

              public var original: Original { __data["original"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var small: Small? { __data["small"] }
              @available(*, deprecated, message: "should not be used will always be null")
              public var medium: Medium? { __data["medium"] }

              /// Publication.AsMirror.Profile.CoverPicture.AsMediaSet.Original
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

              /// Publication.AsMirror.Profile.CoverPicture.AsMediaSet.Small
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

              /// Publication.AsMirror.Profile.CoverPicture.AsMediaSet.Medium
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

        /// Publication.AsMirror.Stats
        ///
        /// Parent Type: `PublicationStats`
        public struct Stats: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

          public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
          public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
          public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var publicationStatsFields: PublicationStatsFields { _toFragment() }
          }
        }

        /// Publication.AsMirror.Metadata
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

        /// Publication.AsMirror.MirrorOf
        ///
        /// Parent Type: `MirrorablePublication`
        public struct MirrorOf: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MirrorablePublication }

          public var asPost: AsPost? { _asInlineFragment() }
          public var asComment: AsComment? { _asInlineFragment() }

          /// Publication.AsMirror.MirrorOf.AsPost
          ///
          /// Parent Type: `Post`
          public struct AsPost: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Publication.AsMirror.MirrorOf
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              PostFields.self,
              MirrorFields.MirrorOf.AsPost.self
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

            /// Publication.AsMirror.MirrorOf.AsPost.Profile
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

              /// Publication.AsMirror.MirrorOf.AsPost.Profile.Picture
              ///
              /// Parent Type: `ProfileMedia`
              public struct Picture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsMirror.MirrorOf.AsPost.Profile.Picture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsPost.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsPost.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Original
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

                  /// Publication.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Small
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

                  /// Publication.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Medium
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

              /// Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
              ///
              /// Parent Type: `ProfileMedia`
              public struct CoverPicture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

                  /// Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

                  /// Publication.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

            /// Publication.AsMirror.MirrorOf.AsPost.Stats
            ///
            /// Parent Type: `PublicationStats`
            public struct Stats: Lens.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

              public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
              public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
              public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

              public struct Fragments: FragmentContainer {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public var publicationStatsFields: PublicationStatsFields { _toFragment() }
              }
            }

            /// Publication.AsMirror.MirrorOf.AsPost.Metadata
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

          /// Publication.AsMirror.MirrorOf.AsComment
          ///
          /// Parent Type: `Comment`
          public struct AsComment: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Publication.AsMirror.MirrorOf
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Comment }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              CommentBaseFields.self,
              CommentFields.self,
              MirrorFields.MirrorOf.AsComment.self
            ] }

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
            public var mainPost: MainPost { __data["mainPost"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var commentBaseFields: CommentBaseFields { _toFragment() }
              public var commentFields: CommentFields { _toFragment() }
            }

            /// Publication.AsMirror.MirrorOf.AsComment.Profile
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

              /// Publication.AsMirror.MirrorOf.AsComment.Profile.Picture
              ///
              /// Parent Type: `ProfileMedia`
              public struct Picture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsMirror.MirrorOf.AsComment.Profile.Picture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.Profile.Picture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.Picture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Original
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

                  /// Publication.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Small
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

                  /// Publication.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Medium
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

              /// Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
              ///
              /// Parent Type: `ProfileMedia`
              public struct CoverPicture: Lens.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                public var asNftImage: AsNftImage? { _asInlineFragment() }
                public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                /// Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsNftImage
                ///
                /// Parent Type: `NftImage`
                public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsNftImage.self
                  ] }

                  public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                  public var tokenId: String { __data["tokenId"] }
                  public var uri: Lens.Url { __data["uri"] }
                  public var verified: Bool { __data["verified"] }
                }

                /// Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet
                ///
                /// Parent Type: `MediaSet`
                public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ProfileFields.CoverPicture.AsMediaSet.self
                  ] }

                  public var original: Original { __data["original"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var small: Small? { __data["small"] }
                  @available(*, deprecated, message: "should not be used will always be null")
                  public var medium: Medium? { __data["medium"] }

                  /// Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Original
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

                  /// Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Small
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

                  /// Publication.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Medium
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

            /// Publication.AsMirror.MirrorOf.AsComment.Stats
            ///
            /// Parent Type: `PublicationStats`
            public struct Stats: Lens.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

              public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
              public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
              public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

              public struct Fragments: FragmentContainer {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public var publicationStatsFields: PublicationStatsFields { _toFragment() }
              }
            }

            /// Publication.AsMirror.MirrorOf.AsComment.Metadata
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

            /// Publication.AsMirror.MirrorOf.AsComment.MainPost
            ///
            /// Parent Type: `MainPostReference`
            public struct MainPost: Lens.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MainPostReference }

              public var asPost: AsPost? { _asInlineFragment() }
              public var asMirror: AsMirror? { _asInlineFragment() }

              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost
              ///
              /// Parent Type: `Post`
              public struct AsPost: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost
                public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
                public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                  PostFields.self,
                  CommentFields.MainPost.AsPost.self
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

                /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile
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

                  /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct Picture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Small
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium
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

                  /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct CoverPicture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

                /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Stats
                ///
                /// Parent Type: `PublicationStats`
                public struct Stats: Lens.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                  public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                  public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                  public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                  public struct Fragments: FragmentContainer {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                  }
                }

                /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Metadata
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

              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror
              ///
              /// Parent Type: `Mirror`
              public struct AsMirror: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost
                public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mirror }
                public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                  MirrorBaseFields.self,
                  CommentFields.MainPost.AsMirror.self
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
                public var mirrorOf: MirrorOf { __data["mirrorOf"] }

                public struct Fragments: FragmentContainer {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public var mirrorBaseFields: MirrorBaseFields { _toFragment() }
                }

                /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile
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

                  /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct Picture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.Picture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Small
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium
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

                  /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                  ///
                  /// Parent Type: `ProfileMedia`
                  public struct CoverPicture: Lens.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                    public var asNftImage: AsNftImage? { _asInlineFragment() }
                    public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsNftImage
                    ///
                    /// Parent Type: `NftImage`
                    public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsNftImage.self
                      ] }

                      public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                      public var tokenId: String { __data["tokenId"] }
                      public var uri: Lens.Url { __data["uri"] }
                      public var verified: Bool { __data["verified"] }
                    }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet
                    ///
                    /// Parent Type: `MediaSet`
                    public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                      public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                        ProfileFields.CoverPicture.AsMediaSet.self
                      ] }

                      public var original: Original { __data["original"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var small: Small? { __data["small"] }
                      @available(*, deprecated, message: "should not be used will always be null")
                      public var medium: Medium? { __data["medium"] }

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Small
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Medium
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

                /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Stats
                ///
                /// Parent Type: `PublicationStats`
                public struct Stats: Lens.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                  public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                  public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                  public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                  public struct Fragments: FragmentContainer {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                  }
                }

                /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Metadata
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

                /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf
                ///
                /// Parent Type: `MirrorablePublication`
                public struct MirrorOf: Lens.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MirrorablePublication }

                  public var asPost: AsPost? { _asInlineFragment() }
                  public var asComment: AsComment? { _asInlineFragment() }

                  /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost
                  ///
                  /// Parent Type: `Post`
                  public struct AsPost: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf
                    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
                    public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                      PostFields.self,
                      CommentFields.MainPost.AsMirror.MirrorOf.AsPost.self
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

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct Picture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Original
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Small
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.Picture.AsMediaSet.Medium
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct CoverPicture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Stats
                    ///
                    /// Parent Type: `PublicationStats`
                    public struct Stats: Lens.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                      public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                      public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                      public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                      public struct Fragments: FragmentContainer {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                      }
                    }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsPost.Metadata
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

                  /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment
                  ///
                  /// Parent Type: `Comment`
                  public struct AsComment: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf
                    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Comment }
                    public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                      CommentBaseFields.self,
                      CommentMirrorOfFields.self,
                      CommentFields.MainPost.AsMirror.MirrorOf.AsComment.self
                    ] }

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
                    public var mainPost: MainPost { __data["mainPost"] }

                    public struct Fragments: FragmentContainer {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public var commentBaseFields: CommentBaseFields { _toFragment() }
                      public var commentMirrorOfFields: CommentMirrorOfFields { _toFragment() }
                    }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct Picture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.Picture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Original
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Small
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.Picture.AsMediaSet.Medium
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                      ///
                      /// Parent Type: `ProfileMedia`
                      public struct CoverPicture: Lens.SelectionSet {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                        public var asNftImage: AsNftImage? { _asInlineFragment() }
                        public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsNftImage
                        ///
                        /// Parent Type: `NftImage`
                        public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsNftImage.self
                          ] }

                          public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                          public var tokenId: String { __data["tokenId"] }
                          public var uri: Lens.Url { __data["uri"] }
                          public var verified: Bool { __data["verified"] }
                        }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet
                        ///
                        /// Parent Type: `MediaSet`
                        public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture
                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                            ProfileFields.CoverPicture.AsMediaSet.self
                          ] }

                          public var original: Original { __data["original"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var small: Small? { __data["small"] }
                          @available(*, deprecated, message: "should not be used will always be null")
                          public var medium: Medium? { __data["medium"] }

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Original
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Small
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Profile.CoverPicture.AsMediaSet.Medium
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

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Stats
                    ///
                    /// Parent Type: `PublicationStats`
                    public struct Stats: Lens.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                      public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                      public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                      public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                      public struct Fragments: FragmentContainer {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                      }
                    }

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.Metadata
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

                    /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost
                    ///
                    /// Parent Type: `MainPostReference`
                    public struct MainPost: Lens.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { Lens.Unions.MainPostReference }

                      public var asPost: AsPost? { _asInlineFragment() }
                      public var asMirror: AsMirror? { _asInlineFragment() }

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost
                      ///
                      /// Parent Type: `Post`
                      public struct AsPost: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost
                        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Post }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          PostFields.self,
                          CommentMirrorOfFields.MainPost.AsPost.self
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

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                          ///
                          /// Parent Type: `ProfileMedia`
                          public struct Picture: Lens.SelectionSet {
                            public let __data: DataDict
                            public init(_dataDict: DataDict) { __data = _dataDict }

                            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                            public var asNftImage: AsNftImage? { _asInlineFragment() }
                            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsNftImage
                            ///
                            /// Parent Type: `NftImage`
                            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.Picture.AsNftImage.self
                              ] }

                              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                              public var tokenId: String { __data["tokenId"] }
                              public var uri: Lens.Url { __data["uri"] }
                              public var verified: Bool { __data["verified"] }
                            }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet
                            ///
                            /// Parent Type: `MediaSet`
                            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.Picture.AsMediaSet.self
                              ] }

                              public var original: Original { __data["original"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var small: Small? { __data["small"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var medium: Medium? { __data["medium"] }

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Original
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Small
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.Picture.AsMediaSet.Medium
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                          ///
                          /// Parent Type: `ProfileMedia`
                          public struct CoverPicture: Lens.SelectionSet {
                            public let __data: DataDict
                            public init(_dataDict: DataDict) { __data = _dataDict }

                            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                            public var asNftImage: AsNftImage? { _asInlineFragment() }
                            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsNftImage
                            ///
                            /// Parent Type: `NftImage`
                            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.CoverPicture.AsNftImage.self
                              ] }

                              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                              public var tokenId: String { __data["tokenId"] }
                              public var uri: Lens.Url { __data["uri"] }
                              public var verified: Bool { __data["verified"] }
                            }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet
                            ///
                            /// Parent Type: `MediaSet`
                            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.CoverPicture.AsMediaSet.self
                              ] }

                              public var original: Original { __data["original"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var small: Small? { __data["small"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var medium: Medium? { __data["medium"] }

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Original
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Small
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Profile.CoverPicture.AsMediaSet.Medium
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

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Stats
                        ///
                        /// Parent Type: `PublicationStats`
                        public struct Stats: Lens.SelectionSet {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                          public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                          public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                          public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                          public struct Fragments: FragmentContainer {
                            public let __data: DataDict
                            public init(_dataDict: DataDict) { __data = _dataDict }

                            public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                          }
                        }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsPost.Metadata
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

                      /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror
                      ///
                      /// Parent Type: `Mirror`
                      public struct AsMirror: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        public let __data: DataDict
                        public init(_dataDict: DataDict) { __data = _dataDict }

                        public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost
                        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mirror }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MirrorBaseFields.self,
                          CommentMirrorOfFields.MainPost.AsMirror.self
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

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                          ///
                          /// Parent Type: `ProfileMedia`
                          public struct Picture: Lens.SelectionSet {
                            public let __data: DataDict
                            public init(_dataDict: DataDict) { __data = _dataDict }

                            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                            public var asNftImage: AsNftImage? { _asInlineFragment() }
                            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsNftImage
                            ///
                            /// Parent Type: `NftImage`
                            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.Picture.AsNftImage.self
                              ] }

                              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                              public var tokenId: String { __data["tokenId"] }
                              public var uri: Lens.Url { __data["uri"] }
                              public var verified: Bool { __data["verified"] }
                            }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet
                            ///
                            /// Parent Type: `MediaSet`
                            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.Picture.AsMediaSet.self
                              ] }

                              public var original: Original { __data["original"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var small: Small? { __data["small"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var medium: Medium? { __data["medium"] }

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Original
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Small
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.Picture.AsMediaSet.Medium
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

                          /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                          ///
                          /// Parent Type: `ProfileMedia`
                          public struct CoverPicture: Lens.SelectionSet {
                            public let __data: DataDict
                            public init(_dataDict: DataDict) { __data = _dataDict }

                            public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

                            public var asNftImage: AsNftImage? { _asInlineFragment() }
                            public var asMediaSet: AsMediaSet? { _asInlineFragment() }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsNftImage
                            ///
                            /// Parent Type: `NftImage`
                            public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.CoverPicture.AsNftImage.self
                              ] }

                              public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
                              public var tokenId: String { __data["tokenId"] }
                              public var uri: Lens.Url { __data["uri"] }
                              public var verified: Bool { __data["verified"] }
                            }

                            /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet
                            ///
                            /// Parent Type: `MediaSet`
                            public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
                              public let __data: DataDict
                              public init(_dataDict: DataDict) { __data = _dataDict }

                              public typealias RootEntityType = Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture
                              public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
                              public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                                ProfileFields.CoverPicture.AsMediaSet.self
                              ] }

                              public var original: Original { __data["original"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var small: Small? { __data["small"] }
                              @available(*, deprecated, message: "should not be used will always be null")
                              public var medium: Medium? { __data["medium"] }

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Original
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Small
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

                              /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Profile.CoverPicture.AsMediaSet.Medium
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

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Stats
                        ///
                        /// Parent Type: `PublicationStats`
                        public struct Stats: Lens.SelectionSet {
                          public let __data: DataDict
                          public init(_dataDict: DataDict) { __data = _dataDict }

                          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }

                          public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
                          public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
                          public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }

                          public struct Fragments: FragmentContainer {
                            public let __data: DataDict
                            public init(_dataDict: DataDict) { __data = _dataDict }

                            public var publicationStatsFields: PublicationStatsFields { _toFragment() }
                          }
                        }

                        /// Publication.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.MirrorOf.AsComment.MainPost.AsMirror.Metadata
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
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
