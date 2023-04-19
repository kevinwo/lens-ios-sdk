// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ModuleFeeAmountParams: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    currency: ContractAddress,
    value: String
  ) {
    __data = InputDict([
      "currency": currency,
      "value": value
    ])
  }

  public var currency: ContractAddress {
    get { __data["currency"] }
    set { __data["currency"] = newValue }
  }

  public var value: String {
    get { __data["value"] }
    set { __data["value"] = newValue }
  }
}
