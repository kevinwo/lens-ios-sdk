// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ProfileQuery: GraphQLQuery {
  public static let operationName: String = "profile"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query profile($request: SingleProfileQueryRequest!) {
        profile(request: $request) {
          __typename
          ...ProfileFields
        }
      }
      """#,
      fragments: [ProfileFields.self, MediaFields.self, FollowModuleFields.self]
    ))

  public var request: SingleProfileQueryRequest

  public init(request: SingleProfileQueryRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("profile", Profile?.self, arguments: ["request": .variable("request")]),
    ] }

    public var profile: Profile? { __data["profile"] }

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

          public typealias RootEntityType = Profile.Picture
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

          public typealias RootEntityType = Profile.Picture
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

          public typealias RootEntityType = Profile.CoverPicture
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

          public typealias RootEntityType = Profile.CoverPicture
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
  }
}
