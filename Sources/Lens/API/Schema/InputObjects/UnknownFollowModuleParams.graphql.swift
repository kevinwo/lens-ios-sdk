// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct UnknownFollowModuleParams: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    contractAddress: ContractAddress,
    data: BlockchainData
  ) {
    __data = InputDict([
      "contractAddress": contractAddress,
      "data": data
    ])
  }

  public var contractAddress: ContractAddress {
    get { __data["contractAddress"] }
    set { __data["contractAddress"] = newValue }
  }

  public var data: BlockchainData {
    get { __data["data"] }
    set { __data["data"] = newValue }
  }
}
