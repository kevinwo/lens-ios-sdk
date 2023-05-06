// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateCollectTypedDataMutation: GraphQLMutation {
  public static let operationName: String = "CreateCollectTypedData"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation CreateCollectTypedData($request: CreateCollectRequest!, $options: TypedDataOptions) {
        result: createCollectTypedData(request: $request, options: $options) {
          __typename
          id
          expiresAt
          typedData {
            __typename
            types {
              __typename
              CollectWithSig {
                __typename
                name
                type
              }
            }
            domain {
              __typename
              name
              chainId
              version
              verifyingContract
            }
            value {
              __typename
              nonce
              deadline
              profileId
              pubId
              data
            }
          }
        }
      }
      """#
    ))

  public var request: CreateCollectRequest
  public var options: GraphQLNullable<TypedDataOptions>

  public init(
    request: CreateCollectRequest,
    options: GraphQLNullable<TypedDataOptions>
  ) {
    self.request = request
    self.options = options
  }

  public var __variables: Variables? { [
    "request": request,
    "options": options
  ] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createCollectTypedData", alias: "result", Result.self, arguments: [
        "request": .variable("request"),
        "options": .variable("options")
      ]),
    ] }

    public var result: Result { __data["result"] }

    /// Result
    ///
    /// Parent Type: `CreateCollectBroadcastItemResult`
    public struct Result: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CreateCollectBroadcastItemResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Lens.BroadcastId.self),
        .field("expiresAt", Lens.DateTime.self),
        .field("typedData", TypedData.self),
      ] }

      public var id: Lens.BroadcastId { __data["id"] }
      public var expiresAt: Lens.DateTime { __data["expiresAt"] }
      public var typedData: TypedData { __data["typedData"] }

      /// Result.TypedData
      ///
      /// Parent Type: `CreateCollectEIP712TypedData`
      public struct TypedData: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CreateCollectEIP712TypedData }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("types", Types.self),
          .field("domain", Domain.self),
          .field("value", Value.self),
        ] }

        public var types: Types { __data["types"] }
        public var domain: Domain { __data["domain"] }
        public var value: Value { __data["value"] }

        /// Result.TypedData.Types
        ///
        /// Parent Type: `CreateCollectEIP712TypedDataTypes`
        public struct Types: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CreateCollectEIP712TypedDataTypes }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("CollectWithSig", [CollectWithSig].self),
          ] }

          public var collectWithSig: [CollectWithSig] { __data["CollectWithSig"] }

          /// Result.TypedData.Types.CollectWithSig
          ///
          /// Parent Type: `EIP712TypedDataField`
          public struct CollectWithSig: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EIP712TypedDataField }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("type", String.self),
            ] }

            public var name: String { __data["name"] }
            public var type: String { __data["type"] }
          }
        }

        /// Result.TypedData.Domain
        ///
        /// Parent Type: `EIP712TypedDataDomain`
        public struct Domain: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EIP712TypedDataDomain }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("chainId", Lens.ChainId.self),
            .field("version", String.self),
            .field("verifyingContract", Lens.ContractAddress.self),
          ] }

          public var name: String { __data["name"] }
          public var chainId: Lens.ChainId { __data["chainId"] }
          public var version: String { __data["version"] }
          public var verifyingContract: Lens.ContractAddress { __data["verifyingContract"] }
        }

        /// Result.TypedData.Value
        ///
        /// Parent Type: `CreateCollectEIP712TypedDataValue`
        public struct Value: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CreateCollectEIP712TypedDataValue }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nonce", Lens.Nonce.self),
            .field("deadline", Lens.UnixTimestamp.self),
            .field("profileId", Lens.ProfileId.self),
            .field("pubId", Lens.PublicationId.self),
            .field("data", Lens.BlockchainData.self),
          ] }

          public var nonce: Lens.Nonce { __data["nonce"] }
          public var deadline: Lens.UnixTimestamp { __data["deadline"] }
          public var profileId: Lens.ProfileId { __data["profileId"] }
          public var pubId: Lens.PublicationId { __data["pubId"] }
          public var data: Lens.BlockchainData { __data["data"] }
        }
      }
    }
  }
}
