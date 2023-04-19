// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateProfileMutation: GraphQLMutation {
  public static let operationName: String = "createProfile"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation createProfile($request: CreateProfileRequest!) {
        createProfile(request: $request) {
          ... on RelayerResult {
            txHash
          }
          ... on RelayError {
            reason
          }
          __typename
        }
      }
      """#
    ))

  public var request: CreateProfileRequest

  public init(request: CreateProfileRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createProfile", CreateProfile.self, arguments: ["request": .variable("request")]),
    ] }

    public var createProfile: CreateProfile { __data["createProfile"] }

    /// CreateProfile
    ///
    /// Parent Type: `RelayResult`
    public struct CreateProfile: Lens.SelectionSet {
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

      /// CreateProfile.AsRelayerResult
      ///
      /// Parent Type: `RelayerResult`
      public struct AsRelayerResult: Lens.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = CreateProfile
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RelayerResult }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("txHash", Lens.TxHash.self),
        ] }

        public var txHash: Lens.TxHash { __data["txHash"] }
      }

      /// CreateProfile.AsRelayError
      ///
      /// Parent Type: `RelayError`
      public struct AsRelayError: Lens.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = CreateProfile
        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.RelayError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("reason", GraphQLEnum<Lens.RelayErrorReasons>.self),
        ] }

        public var reason: GraphQLEnum<Lens.RelayErrorReasons> { __data["reason"] }
      }
    }
  }
}
