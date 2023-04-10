// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ExplorePublicationRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar> = nil,
    cursor: GraphQLNullable<Cursor> = nil,
    timestamp: GraphQLNullable<TimestampScalar> = nil,
    sortCriteria: GraphQLEnum<PublicationSortCriteria>,
    sources: GraphQLNullable<[Sources]>,
    publicationTypes: GraphQLNullable<[GraphQLEnum<PublicationTypes>]> = nil,
    noRandomize: GraphQLNullable<Bool> = nil,
    excludeProfileIds: GraphQLNullable<[ProfileId]> = nil,
    metadata: GraphQLNullable<PublicationMetadataFilters> = nil,
    customFilters: GraphQLNullable<[GraphQLEnum<CustomFiltersTypes>]>
  ) {
    __data = InputDict([
      "limit": limit,
      "cursor": cursor,
      "timestamp": timestamp,
      "sortCriteria": sortCriteria,
      "sources": sources,
      "publicationTypes": publicationTypes,
      "noRandomize": noRandomize,
      "excludeProfileIds": excludeProfileIds,
      "metadata": metadata,
      "customFilters": customFilters
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

  public var timestamp: GraphQLNullable<TimestampScalar> {
    get { __data["timestamp"] }
    set { __data["timestamp"] = newValue }
  }

  public var sortCriteria: GraphQLEnum<PublicationSortCriteria> {
    get { __data["sortCriteria"] }
    set { __data["sortCriteria"] = newValue }
  }

  public var sources: GraphQLNullable<[Sources]> {
    get { __data["sources"] }
    set { __data["sources"] = newValue }
  }

  public var publicationTypes: GraphQLNullable<[GraphQLEnum<PublicationTypes>]> {
    get { __data["publicationTypes"] }
    set { __data["publicationTypes"] = newValue }
  }

  public var noRandomize: GraphQLNullable<Bool> {
    get { __data["noRandomize"] }
    set { __data["noRandomize"] = newValue }
  }

  public var excludeProfileIds: GraphQLNullable<[ProfileId]> {
    get { __data["excludeProfileIds"] }
    set { __data["excludeProfileIds"] = newValue }
  }

  public var metadata: GraphQLNullable<PublicationMetadataFilters> {
    get { __data["metadata"] }
    set { __data["metadata"] = newValue }
  }

  public var customFilters: GraphQLNullable<[GraphQLEnum<CustomFiltersTypes>]> {
    get { __data["customFilters"] }
    set { __data["customFilters"] = newValue }
  }
}
