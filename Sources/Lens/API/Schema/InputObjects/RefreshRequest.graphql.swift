// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct RefreshRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    refreshToken: Jwt
  ) {
    __data = InputDict([
      "refreshToken": refreshToken
    ])
  }

  public var refreshToken: Jwt {
    get { __data["refreshToken"] }
    set { __data["refreshToken"] = newValue }
  }
}
