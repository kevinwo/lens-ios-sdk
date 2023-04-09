// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ChallengeQuery: GraphQLQuery {
  public static let operationName: String = "Challenge"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query Challenge($request: ChallengeRequest!) {
        challenge(request: $request) {
          __typename
          text
        }
      }
      """#
    ))

  public var request: ChallengeRequest

  public init(request: ChallengeRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: LensAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("challenge", Challenge.self, arguments: ["request": .variable("request")]),
    ] }

    public var challenge: Challenge { __data["challenge"] }

    /// Challenge
    ///
    /// Parent Type: `AuthChallengeResult`
    public struct Challenge: LensAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.AuthChallengeResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("text", String.self),
      ] }

      public var text: String { __data["text"] }
    }
  }
}
