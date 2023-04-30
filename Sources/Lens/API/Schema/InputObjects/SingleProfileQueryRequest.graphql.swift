// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct SingleProfileQueryRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    profileId: GraphQLNullable<ProfileId>? = nil,
    handle: GraphQLNullable<Handle>? = nil
  ) {
    /// There appears to be an issue with the way the Apollo iOS library handles null arguments
    /// (or maybe the way the Lens GraphQL API handles them?). In any case, we need to work around
    /// this for now by manually not including any null arguments in this request.
    var dict = [String: any GraphQLOperationVariableValue]()
    if let profileId { dict["profileId"] = profileId }
    if let handle { dict["handle"] = handle }

    __data = InputDict(dict)
  }

  public var profileId: GraphQLNullable<ProfileId> {
    get { __data["profileId"] }
    set { __data["profileId"] = newValue }
  }

  public var handle: GraphQLNullable<Handle> {
    get { __data["handle"] }
    set { __data["handle"] = newValue }
  }
}
