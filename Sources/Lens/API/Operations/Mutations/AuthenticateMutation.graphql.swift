// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AuthenticateMutation: GraphQLMutation {
  public static let operationName: String = "authenticate"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation authenticate($request: SignedAuthChallenge!) {
        authenticate(request: $request) {
          __typename
          accessToken
          refreshToken
        }
      }
      """#
    ))

  public var request: SignedAuthChallenge

  public init(request: SignedAuthChallenge) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("authenticate", Authenticate.self, arguments: ["request": .variable("request")]),
    ] }

    public var authenticate: Authenticate { __data["authenticate"] }

    /// Authenticate
    ///
    /// Parent Type: `AuthenticationResult`
    public struct Authenticate: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AuthenticationResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("accessToken", Lens.Jwt.self),
        .field("refreshToken", Lens.Jwt.self),
      ] }

      public var accessToken: Lens.Jwt { __data["accessToken"] }
      public var refreshToken: Lens.Jwt { __data["refreshToken"] }
    }
  }
}
