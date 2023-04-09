// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ChallengeRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    address: EthereumAddress
  ) {
    __data = InputDict([
      "address": address
    ])
  }

  public var address: EthereumAddress {
    get { __data["address"] }
    set { __data["address"] = newValue }
  }
}
