// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct EncryptedMediaSetFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment EncryptedMediaSetFields on EncryptedMediaSet {
      __typename
      original {
        __typename
        ...EncryptedMediaFields
      }
      small {
        __typename
        ...EncryptedMediaFields
      }
      medium {
        __typename
        ...EncryptedMediaFields
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMediaSet }
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

  /// Original
  ///
  /// Parent Type: `EncryptedMedia`
  public struct Original: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMedia }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(EncryptedMediaFields.self),
    ] }

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

  /// Small
  ///
  /// Parent Type: `EncryptedMedia`
  public struct Small: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMedia }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(EncryptedMediaFields.self),
    ] }

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

  /// Medium
  ///
  /// Parent Type: `EncryptedMedia`
  public struct Medium: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EncryptedMedia }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(EncryptedMediaFields.self),
    ] }

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
