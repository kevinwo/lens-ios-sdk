// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CollectConditionFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment CollectConditionFields on CollectConditionOutput {
      __typename
      publicationId
      thisPublication
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("publicationId", Lens.InternalPublicationId?.self),
    .field("thisPublication", Bool?.self),
  ] }

  public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
  public var thisPublication: Bool? { __data["thisPublication"] }
}
