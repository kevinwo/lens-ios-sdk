// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct FollowConditionFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment FollowConditionFields on FollowConditionOutput {
      __typename
      profileId
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("profileId", Lens.ProfileId.self),
  ] }

  public var profileId: Lens.ProfileId { __data["profileId"] }
}
