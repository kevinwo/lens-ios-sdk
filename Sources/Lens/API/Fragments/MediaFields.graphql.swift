// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct MediaFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment MediaFields on Media {
      __typename
      url
      width
      height
      mimeType
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Media }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("url", Lens.Url.self),
    .field("width", Int?.self),
    .field("height", Int?.self),
    .field("mimeType", Lens.MimeType?.self),
  ] }

  public var url: Lens.Url { __data["url"] }
  public var width: Int? { __data["width"] }
  public var height: Int? { __data["height"] }
  public var mimeType: Lens.MimeType? { __data["mimeType"] }
}
