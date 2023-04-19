// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ProfileQueryRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar> = nil,
    cursor: GraphQLNullable<Cursor> = nil,
    profileIds: GraphQLNullable<[ProfileId]> = nil,
    ownedBy: GraphQLNullable<[EthereumAddress]> = nil,
    handles: GraphQLNullable<[Handle]> = nil,
    whoMirroredPublicationId: GraphQLNullable<InternalPublicationId> = nil
  ) {
    __data = InputDict([
      "limit": limit,
      "cursor": cursor,
      "profileIds": profileIds,
      "ownedBy": ownedBy,
      "handles": handles,
      "whoMirroredPublicationId": whoMirroredPublicationId
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

  public var profileIds: GraphQLNullable<[ProfileId]> {
    get { __data["profileIds"] }
    set { __data["profileIds"] = newValue }
  }

  public var ownedBy: GraphQLNullable<[EthereumAddress]> {
    get { __data["ownedBy"] }
    set { __data["ownedBy"] = newValue }
  }

  public var handles: GraphQLNullable<[Handle]> {
    get { __data["handles"] }
    set { __data["handles"] = newValue }
  }

  public var whoMirroredPublicationId: GraphQLNullable<InternalPublicationId> {
    get { __data["whoMirroredPublicationId"] }
    set { __data["whoMirroredPublicationId"] = newValue }
  }
}
