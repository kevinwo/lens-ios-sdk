// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct FeedRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar>? = nil,
    cursor: GraphQLNullable<Cursor>? = nil,
    profileId: ProfileId,
    feedEventItemTypes: GraphQLNullable<[GraphQLEnum<FeedEventItemType>]>? = nil,
    sources: GraphQLNullable<[Sources]>? = nil,
    metadata: GraphQLNullable<PublicationMetadataFilters>? = nil
  ) {
    /// There appears to be an issue with the way the Apollo iOS library handles null arguments
    /// (or maybe the way the Lens GraphQL API handles them?). In any case, we need to work around
    /// this for now by manually not including any null arguments in this request.
    var dict = [String: any GraphQLOperationVariableValue]()
    dict["profileId"] = profileId

    if let limit { dict["limit"] = limit }
    if let cursor { dict["cursor"] = cursor }
    if let feedEventItemTypes { dict["feedEventItemTypes"] = feedEventItemTypes }
    if let sources { dict["sources"] = sources }
    if let metadata { dict["metadata"] = metadata }

    __data = InputDict(dict)
  }

  public var limit: GraphQLNullable<LimitScalar> {
    get { __data["limit"] }
    set { __data["limit"] = newValue }
  }

  public var cursor: GraphQLNullable<Cursor> {
    get { __data["cursor"] }
    set { __data["cursor"] = newValue }
  }

  public var profileId: ProfileId {
    get { __data["profileId"] }
    set { __data["profileId"] = newValue }
  }

  public var feedEventItemTypes: GraphQLNullable<[GraphQLEnum<FeedEventItemType>]> {
    get { __data["feedEventItemTypes"] }
    set { __data["feedEventItemTypes"] = newValue }
  }

  public var sources: GraphQLNullable<[Sources]> {
    get { __data["sources"] }
    set { __data["sources"] = newValue }
  }

  public var metadata: GraphQLNullable<PublicationMetadataFilters> {
    get { __data["metadata"] }
    set { __data["metadata"] = newValue }
  }
}
