// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ExplorePublicationRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar>? = nil,
    cursor: GraphQLNullable<Cursor>? = nil,
    timestamp: GraphQLNullable<TimestampScalar>? = nil,
    sortCriteria: GraphQLEnum<PublicationSortCriteria>,
    sources: GraphQLNullable<[Sources]>? = nil,
    publicationTypes: GraphQLNullable<[GraphQLEnum<PublicationTypes>]>? = nil,
    noRandomize: GraphQLNullable<Bool>? = nil,
    excludeProfileIds: GraphQLNullable<[ProfileId]>? = nil,
    metadata: GraphQLNullable<PublicationMetadataFilters>? = nil,
    customFilters: GraphQLNullable<[GraphQLEnum<CustomFiltersTypes>]>? = nil
  ) {
      /// There appears to be an issue with the way the Apollo iOS library handles null arguments
      /// (or maybe the way the Lens GraphQL API handles them?). In any case, we need to work around
      /// this for now by manually not including any null arguments in this request.
      var dict = [String: any GraphQLOperationVariableValue]()
      dict["sortCriteria"] = sortCriteria

      if let limit { dict["limit"] = limit }
      if let cursor { dict["cursor"] = cursor }
      if let timestamp { dict["timestamp"] = timestamp }
      if let sources { dict["sources"] = sources }
      if let publicationTypes { dict["publicationTypes"] = publicationTypes }
      if let noRandomize { dict["noRandomize"] = noRandomize }
      if let excludeProfileIds { dict["excludeProfileIds"] = excludeProfileIds }
      if let metadata { dict["metadata"] = metadata }
      if let customFilters { dict["customFilters"] = customFilters }
      print(dict)

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
