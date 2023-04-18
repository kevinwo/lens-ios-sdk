// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct SignedAuthChallenge: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    address: EthereumAddress,
    signature: Signature
  ) {
    __data = InputDict([
      "address": address,
      "signature": signature
    ])
  }

  public var address: EthereumAddress {
    get { __data["address"] }
    set { __data["address"] = newValue }
  }

  public var signature: Signature {
    get { __data["signature"] }
    set { __data["signature"] = newValue }
  }
}
