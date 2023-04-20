// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ProfileQueryRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar>? = nil,
    cursor: GraphQLNullable<Cursor>? = nil,
    profileIds: GraphQLNullable<[ProfileId]>? = nil,
    ownedBy: GraphQLNullable<[EthereumAddress]>? = nil,
    handles: GraphQLNullable<[Handle]>? = nil,
    whoMirroredPublicationId: GraphQLNullable<InternalPublicationId>? = nil
  ) {
    /// There appears to be an issue with the way the Apollo iOS library handles null arguments
    /// (or maybe the way the Lens GraphQL API handles them?). In any case, we need to work around
    /// this for now by manually not including any null arguments in this request.
    var dict = [String: any GraphQLOperationVariableValue]()
    if let limit { dict["limit"] = limit }
    if let cursor { dict["cursor"] = cursor }
    if let profileIds { dict["profileIds"] = profileIds }
    if let ownedBy { dict["ownedBy"] = ownedBy }
    if let handles { dict["handles"] = handles }
    if let whoMirroredPublicationId { dict["whoMirroredPublicationId"] = whoMirroredPublicationId }

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
