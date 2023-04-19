// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct FeeFollowModuleParams: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    amount: ModuleFeeAmountParams,
    recipient: EthereumAddress
  ) {
    __data = InputDict([
      "amount": amount,
      "recipient": recipient
    ])
  }

  public var amount: ModuleFeeAmountParams {
    get { __data["amount"] }
    set { __data["amount"] = newValue }
  }

  public var recipient: EthereumAddress {
    get { __data["recipient"] }
    set { __data["recipient"] = newValue }
  }
}
