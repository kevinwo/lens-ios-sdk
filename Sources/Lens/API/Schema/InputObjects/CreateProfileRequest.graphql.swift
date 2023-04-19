// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreateProfileRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    handle: CreateHandle,
    profilePictureUri: GraphQLNullable<Url> = nil,
    followModule: GraphQLNullable<FollowModuleParams> = nil,
    followNFTURI: GraphQLNullable<Url> = nil
  ) {
    __data = InputDict([
      "handle": handle,
      "profilePictureUri": profilePictureUri,
      "followModule": followModule,
      "followNFTURI": followNFTURI
    ])
  }

  public var handle: CreateHandle {
    get { __data["handle"] }
    set { __data["handle"] = newValue }
  }

  public var profilePictureUri: GraphQLNullable<Url> {
    get { __data["profilePictureUri"] }
    set { __data["profilePictureUri"] = newValue }
  }

  public var followModule: GraphQLNullable<FollowModuleParams> {
    get { __data["followModule"] }
    set { __data["followModule"] = newValue }
  }

  public var followNFTURI: GraphQLNullable<Url> {
    get { __data["followNFTURI"] }
    set { __data["followNFTURI"] = newValue }
  }
}
