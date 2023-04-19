// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct FollowModuleParams: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    feeFollowModule: GraphQLNullable<FeeFollowModuleParams> = nil,
    profileFollowModule: GraphQLNullable<Bool> = nil,
    revertFollowModule: GraphQLNullable<Bool> = nil,
    freeFollowModule: GraphQLNullable<Bool> = nil,
    unknownFollowModule: GraphQLNullable<UnknownFollowModuleParams> = nil
  ) {
    __data = InputDict([
      "feeFollowModule": feeFollowModule,
      "profileFollowModule": profileFollowModule,
      "revertFollowModule": revertFollowModule,
      "freeFollowModule": freeFollowModule,
      "unknownFollowModule": unknownFollowModule
    ])
  }

  public var feeFollowModule: GraphQLNullable<FeeFollowModuleParams> {
    get { __data["feeFollowModule"] }
    set { __data["feeFollowModule"] = newValue }
  }

  public var profileFollowModule: GraphQLNullable<Bool> {
    get { __data["profileFollowModule"] }
    set { __data["profileFollowModule"] = newValue }
  }

  public var revertFollowModule: GraphQLNullable<Bool> {
    get { __data["revertFollowModule"] }
    set { __data["revertFollowModule"] = newValue }
  }

  public var freeFollowModule: GraphQLNullable<Bool> {
    get { __data["freeFollowModule"] }
    set { __data["freeFollowModule"] = newValue }
  }

  public var unknownFollowModule: GraphQLNullable<UnknownFollowModuleParams> {
    get { __data["unknownFollowModule"] }
    set { __data["unknownFollowModule"] = newValue }
  }
}
