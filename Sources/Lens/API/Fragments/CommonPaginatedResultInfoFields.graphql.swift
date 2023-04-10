// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CommonPaginatedResultInfoFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment CommonPaginatedResultInfoFields on PaginatedResultInfo {
      __typename
      prev
      next
      totalCount
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PaginatedResultInfo }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("prev", Lens.Cursor?.self),
    .field("next", Lens.Cursor?.self),
    .field("totalCount", Int?.self),
  ] }

  public var prev: Lens.Cursor? { __data["prev"] }
  public var next: Lens.Cursor? { __data["next"] }
  @available(*, deprecated, message: "Total counts is expensive and in dynamic nature of queries it slows stuff down. Most the time you do not need this you can just use the `next` property to see if there is more data. This will be removed soon. The only use case anyone is using this right now is on notification query, this should be changed to query the notifications and cache the last notification id. You can then keep checking if the id changes you know more notifications.")
  public var totalCount: Int? { __data["totalCount"] }
}
