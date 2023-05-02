// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PublicationsQueryRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar> = nil,
    cursor: GraphQLNullable<Cursor> = nil,
    profileId: GraphQLNullable<ProfileId> = nil,
    profileIds: GraphQLNullable<[ProfileId]> = nil,
    publicationTypes: GraphQLNullable<[GraphQLEnum<PublicationTypes>]> = nil,
    commentsOf: GraphQLNullable<InternalPublicationId> = nil,
    commentsOfOrdering: GraphQLNullable<GraphQLEnum<CommentOrderingTypes>>,
    commentsRankingFilter: GraphQLNullable<GraphQLEnum<CommentRankingFilter>> = nil,
    sources: GraphQLNullable<[Sources]>,
    collectedBy: GraphQLNullable<EthereumAddress> = nil,
    publicationIds: GraphQLNullable<[InternalPublicationId]> = nil,
    metadata: GraphQLNullable<PublicationMetadataFilters> = nil,
    customFilters: GraphQLNullable<[GraphQLEnum<CustomFiltersTypes>]>
  ) {
    __data = InputDict([
      "limit": limit,
      "cursor": cursor,
      "profileId": profileId,
      "profileIds": profileIds,
      "publicationTypes": publicationTypes,
      "commentsOf": commentsOf,
      "commentsOfOrdering": commentsOfOrdering,
      "commentsRankingFilter": commentsRankingFilter,
      "sources": sources,
      "collectedBy": collectedBy,
      "publicationIds": publicationIds,
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

  public var profileId: GraphQLNullable<ProfileId> {
    get { __data["profileId"] }
    set { __data["profileId"] = newValue }
  }

  public var profileIds: GraphQLNullable<[ProfileId]> {
    get { __data["profileIds"] }
    set { __data["profileIds"] = newValue }
  }

  public var publicationTypes: GraphQLNullable<[GraphQLEnum<PublicationTypes>]> {
    get { __data["publicationTypes"] }
    set { __data["publicationTypes"] = newValue }
  }

  public var commentsOf: GraphQLNullable<InternalPublicationId> {
    get { __data["commentsOf"] }
    set { __data["commentsOf"] = newValue }
  }

  public var commentsOfOrdering: GraphQLNullable<GraphQLEnum<CommentOrderingTypes>> {
    get { __data["commentsOfOrdering"] }
    set { __data["commentsOfOrdering"] = newValue }
  }

  public var commentsRankingFilter: GraphQLNullable<GraphQLEnum<CommentRankingFilter>> {
    get { __data["commentsRankingFilter"] }
    set { __data["commentsRankingFilter"] = newValue }
  }

  public var sources: GraphQLNullable<[Sources]> {
    get { __data["sources"] }
    set { __data["sources"] = newValue }
  }

  public var collectedBy: GraphQLNullable<EthereumAddress> {
    get { __data["collectedBy"] }
    set { __data["collectedBy"] = newValue }
  }

  public var publicationIds: GraphQLNullable<[InternalPublicationId]> {
    get { __data["publicationIds"] }
    set { __data["publicationIds"] = newValue }
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
