// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct NFTsRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    limit: GraphQLNullable<LimitScalar>? = nil,
    cursor: GraphQLNullable<Cursor>? = nil,
    ownerAddress: EthereumAddress,
    contractAddress: GraphQLNullable<ContractAddress>? = nil,
    chainIds: [ChainId]
  ) {
    /// There appears to be an issue with the way the Apollo iOS library handles null arguments
    /// (or maybe the way the Lens GraphQL API handles them?). In any case, we need to work around
    /// this for now by manually not including any null arguments in this request.
    var dict: [String: any GraphQLOperationVariableValue] = [
      "ownerAddress": ownerAddress,
      "chainIds": chainIds
    ]
    if let limit { dict["limit"] = limit }
    if let cursor { dict["cursor"] = cursor }
    if let contractAddress { dict["contractAddress"] = contractAddress }

    __data = InputDict(dict)
  }

  public var limit: GraphQLNullable<LimitScalar> {
    get { __data["limit"] }
    set { __data["limit"] = newValue }
  }

  public var cursor: GraphQLNullable<Cursor> {
    get { __data["cursor"] }
    set { __data["cursor"] = newValue }
  }

  public var ownerAddress: EthereumAddress {
    get { __data["ownerAddress"] }
    set { __data["ownerAddress"] = newValue }
  }

  public var contractAddress: GraphQLNullable<ContractAddress> {
    get { __data["contractAddress"] }
    set { __data["contractAddress"] = newValue }
  }

  public var chainIds: [ChainId] {
    get { __data["chainIds"] }
    set { __data["chainIds"] = newValue }
  }
}
