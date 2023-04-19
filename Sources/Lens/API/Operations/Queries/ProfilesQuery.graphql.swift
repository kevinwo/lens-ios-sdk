// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ProfilesQuery: GraphQLQuery {
  public static let operationName: String = "profiles"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query profiles($request: ProfileQueryRequest!) {
        profiles(request: $request) {
          __typename
          items {
            __typename
            ...ProfileFields
          }
          pageInfo {
            __typename
            ...CommonPaginatedResultInfoFields
          }
        }
      }
      """#,
      fragments: [ProfileFields.self, MediaFields.self, FollowModuleFields.self, CommonPaginatedResultInfoFields.self]
    ))

  public var request: ProfileQueryRequest

  public init(request: ProfileQueryRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("profiles", Profiles.self, arguments: ["request": .variable("request")]),
    ] }

    public var profiles: Profiles { __data["profiles"] }

    /// Profiles
    ///
    /// Parent Type: `PaginatedProfileResult`
    public struct Profiles: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PaginatedProfileResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("items", [Item].self),
        .field("pageInfo", PageInfo.self),
      ] }

      public var items: [Item] { __data["items"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }

      /// Profiles.Item
      ///
      /// Parent Type: `Profile`
      public struct Item: Lens.SelectionSet {
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

        /// Profiles.Item.Picture
        ///
        /// Parent Type: `ProfileMedia`
        public struct Picture: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

          public var asNftImage: AsNftImage? { _asInlineFragment() }
          public var asMediaSet: AsMediaSet? { _asInlineFragment() }

          /// Profiles.Item.Picture.AsNftImage
          ///
          /// Parent Type: `NftImage`
          public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Profiles.Item.Picture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.Picture.AsNftImage.self
            ] }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var tokenId: String { __data["tokenId"] }
            public var uri: Lens.Url { __data["uri"] }
            public var verified: Bool { __data["verified"] }
          }

          /// Profiles.Item.Picture.AsMediaSet
          ///
          /// Parent Type: `MediaSet`
          public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Profiles.Item.Picture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.Picture.AsMediaSet.self
            ] }

            public var original: Original { __data["original"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var small: Small? { __data["small"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var medium: Medium? { __data["medium"] }

            /// Profiles.Item.Picture.AsMediaSet.Original
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

            /// Profiles.Item.Picture.AsMediaSet.Small
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

            /// Profiles.Item.Picture.AsMediaSet.Medium
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

        /// Profiles.Item.CoverPicture
        ///
        /// Parent Type: `ProfileMedia`
        public struct CoverPicture: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ProfileMedia }

          public var asNftImage: AsNftImage? { _asInlineFragment() }
          public var asMediaSet: AsMediaSet? { _asInlineFragment() }

          /// Profiles.Item.CoverPicture.AsNftImage
          ///
          /// Parent Type: `NftImage`
          public struct AsNftImage: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Profiles.Item.CoverPicture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftImage }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.CoverPicture.AsNftImage.self
            ] }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var tokenId: String { __data["tokenId"] }
            public var uri: Lens.Url { __data["uri"] }
            public var verified: Bool { __data["verified"] }
          }

          /// Profiles.Item.CoverPicture.AsMediaSet
          ///
          /// Parent Type: `MediaSet`
          public struct AsMediaSet: Lens.InlineFragment, ApolloAPI.CompositeInlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = Profiles.Item.CoverPicture
            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.MediaSet }
            public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
              ProfileFields.CoverPicture.AsMediaSet.self
            ] }

            public var original: Original { __data["original"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var small: Small? { __data["small"] }
            @available(*, deprecated, message: "should not be used will always be null")
            public var medium: Medium? { __data["medium"] }

            /// Profiles.Item.CoverPicture.AsMediaSet.Original
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

            /// Profiles.Item.CoverPicture.AsMediaSet.Small
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

            /// Profiles.Item.CoverPicture.AsMediaSet.Medium
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

      /// Profiles.PageInfo
      ///
      /// Parent Type: `PaginatedResultInfo`
      public struct PageInfo: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PaginatedResultInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CommonPaginatedResultInfoFields.self),
        ] }

        public var prev: Lens.Cursor? { __data["prev"] }
        public var next: Lens.Cursor? { __data["next"] }
        @available(*, deprecated, message: "Total counts is expensive and in dynamic nature of queries it slows stuff down. Most the time you do not need this you can just use the `next` property to see if there is more data. This will be removed soon. The only use case anyone is using this right now is on notification query, this should be changed to query the notifications and cache the last notification id. You can then keep checking if the id changes you know more notifications.")
        public var totalCount: Int? { __data["totalCount"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var commonPaginatedResultInfoFields: CommonPaginatedResultInfoFields { _toFragment() }
        }
      }
    }
  }
}
