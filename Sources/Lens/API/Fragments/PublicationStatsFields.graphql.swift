// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct PublicationStatsFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment PublicationStatsFields on PublicationStats {
      __typename
      totalUpvotes
      totalAmountOfMirrors
      totalAmountOfCollects
      totalAmountOfComments
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.PublicationStats }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("totalUpvotes", Int.self),
    .field("totalAmountOfMirrors", Int.self),
    .field("totalAmountOfCollects", Int.self),
    .field("totalAmountOfComments", Int.self),
  ] }

  public var totalUpvotes: Int { __data["totalUpvotes"] }
  public var totalAmountOfMirrors: Int { __data["totalAmountOfMirrors"] }
  public var totalAmountOfCollects: Int { __data["totalAmountOfCollects"] }
  public var totalAmountOfComments: Int { __data["totalAmountOfComments"] }
}
