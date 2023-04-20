// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RefreshMutation: GraphQLMutation {
  public static let operationName: String = "Refresh"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation Refresh($request: RefreshRequest!) {
        refresh(request: $request) {
          __typename
          accessToken
          refreshToken
        }
      }
      """#
    ))

  public var request: RefreshRequest

  public init(request: RefreshRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("refresh", Refresh.self, arguments: ["request": .variable("request")]),
    ] }

    public var refresh: Refresh { __data["refresh"] }

    /// Refresh
    ///
    /// Parent Type: `AuthenticationResult`
    public struct Refresh: Lens.SelectionSet {
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
