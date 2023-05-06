// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct TypedDataOptions: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    overrideSigNonce: Nonce
  ) {
    __data = InputDict([
      "overrideSigNonce": overrideSigNonce
    ])
  }

  public var overrideSigNonce: Nonce {
    get { __data["overrideSigNonce"] }
    set { __data["overrideSigNonce"] = newValue }
  }
}
