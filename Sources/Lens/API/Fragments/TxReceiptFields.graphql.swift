// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct TxReceiptFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment TxReceiptFields on TransactionReceipt {
      __typename
      to
      from
      contractAddress
      transactionIndex
      root
      gasUsed
      logsBloom
      blockHash
      transactionHash
      blockNumber
      confirmations
      cumulativeGasUsed
      effectiveGasPrice
      byzantium
      type
      status
      logs {
        __typename
        blockNumber
        blockHash
        transactionIndex
        removed
        address
        data
        topics
        transactionHash
        logIndex
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.TransactionReceipt }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("to", Lens.EthereumAddress?.self),
    .field("from", Lens.EthereumAddress.self),
    .field("contractAddress", Lens.ContractAddress?.self),
    .field("transactionIndex", Int.self),
    .field("root", String?.self),
    .field("gasUsed", String.self),
    .field("logsBloom", String.self),
    .field("blockHash", String.self),
    .field("transactionHash", Lens.TxHash.self),
    .field("blockNumber", Int.self),
    .field("confirmations", Int.self),
    .field("cumulativeGasUsed", String.self),
    .field("effectiveGasPrice", String.self),
    .field("byzantium", Bool.self),
    .field("type", Int.self),
    .field("status", Int?.self),
    .field("logs", [Log].self),
  ] }

  public var to: Lens.EthereumAddress? { __data["to"] }
  public var from: Lens.EthereumAddress { __data["from"] }
  public var contractAddress: Lens.ContractAddress? { __data["contractAddress"] }
  public var transactionIndex: Int { __data["transactionIndex"] }
  public var root: String? { __data["root"] }
  public var gasUsed: String { __data["gasUsed"] }
  public var logsBloom: String { __data["logsBloom"] }
  public var blockHash: String { __data["blockHash"] }
  public var transactionHash: Lens.TxHash { __data["transactionHash"] }
  public var blockNumber: Int { __data["blockNumber"] }
  public var confirmations: Int { __data["confirmations"] }
  public var cumulativeGasUsed: String { __data["cumulativeGasUsed"] }
  public var effectiveGasPrice: String { __data["effectiveGasPrice"] }
  public var byzantium: Bool { __data["byzantium"] }
  public var type: Int { __data["type"] }
  public var status: Int? { __data["status"] }
  public var logs: [Log] { __data["logs"] }

  /// Log
  ///
  /// Parent Type: `Log`
  public struct Log: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Log }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("blockNumber", Int.self),
      .field("blockHash", String.self),
      .field("transactionIndex", Int.self),
      .field("removed", Bool.self),
      .field("address", Lens.ContractAddress.self),
      .field("data", String.self),
      .field("topics", [String].self),
      .field("transactionHash", Lens.TxHash.self),
      .field("logIndex", Int.self),
    ] }

    public var blockNumber: Int { __data["blockNumber"] }
    public var blockHash: String { __data["blockHash"] }
    public var transactionIndex: Int { __data["transactionIndex"] }
    public var removed: Bool { __data["removed"] }
    public var address: Lens.ContractAddress { __data["address"] }
    public var data: String { __data["data"] }
    public var topics: [String] { __data["topics"] }
    public var transactionHash: Lens.TxHash { __data["transactionHash"] }
    public var logIndex: Int { __data["logIndex"] }
  }
}
