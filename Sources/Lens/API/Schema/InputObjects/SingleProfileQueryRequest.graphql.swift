// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct SingleProfileQueryRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    profileId: GraphQLNullable<ProfileId> = nil,
    handle: GraphQLNullable<Handle> = nil
  ) {
    __data = InputDict([
      "profileId": profileId,
      "handle": handle
    ])
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
