// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BroadcastMutation: GraphQLMutation {
  public static let operationName: String = "Broadcast"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation Broadcast($request: BroadcastRequest!) {
        broadcast(request: $request) {
          __typename
          ... on RelayerResult {
            txHash
            txId
          }
          ... on RelayError {
            reason
          }
        }
      }
      """#
    ))

  public var request: BroadcastRequest

  public init(request: BroadcastRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("broadcast", Broadcast.self, arguments: ["request": .variable("request")]),
    ] }

    public var broadcast: Broadcast { __data["broadcast"] }

    /// Broadcast
    ///
    /// Parent Type: `RelayResult`
    public struct Broadcast: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Unions.RelayResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsRelayerResult.self),
        .inlineFragment(AsRelayError.self),
      ] }

      public var asRelayerResult: AsRelayerResult? { _asInlineFragment() }
      public var asRelayError: AsRelayError? { _asInlineFragment() }

      /// Broadcast.AsRelayerResult
      ///
      /// Parent Type: `RelayerResult`
      public struct AsRelayerResult: Lens.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = Broadcast
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RelayerResult }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("txHash", Lens.TxHash.self),
          .field("txId", Lens.TxId.self),
        ] }

        public var txHash: Lens.TxHash { __data["txHash"] }
        public var txId: Lens.TxId { __data["txId"] }
      }

      /// Broadcast.AsRelayError
      ///
      /// Parent Type: `RelayError`
      public struct AsRelayError: Lens.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = Broadcast
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RelayError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("reason", GraphQLEnum<Lens.RelayErrorReasons>.self),
        ] }

        public var reason: GraphQLEnum<Lens.RelayErrorReasons> { __data["reason"] }
      }
    }
  }
}
