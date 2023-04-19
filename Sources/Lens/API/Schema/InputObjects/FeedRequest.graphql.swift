// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct FeedRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar> = nil,
    cursor: GraphQLNullable<Cursor> = nil,
    profileId: ProfileId,
    feedEventItemTypes: GraphQLNullable<[GraphQLEnum<FeedEventItemType>]>,
    sources: GraphQLNullable<[Sources]>,
    metadata: GraphQLNullable<PublicationMetadataFilters> = nil
  ) {
    __data = InputDict([
      "limit": limit,
      "cursor": cursor,
      "profileId": profileId,
      "feedEventItemTypes": feedEventItemTypes,
      "sources": sources,
      "metadata": metadata
    ])
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
