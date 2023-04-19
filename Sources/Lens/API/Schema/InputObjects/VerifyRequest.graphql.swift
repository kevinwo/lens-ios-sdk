// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct VerifyRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    accessToken: Jwt
  ) {
    __data = InputDict([
      "accessToken": accessToken
    ])
  }

  public var accessToken: Jwt {
    get { __data["accessToken"] }
    set { __data["accessToken"] = newValue }
  }
}
