// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class VerifyQuery: GraphQLQuery {
  public static let operationName: String = "verify"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query verify($request: VerifyRequest!) {
        verify(request: $request)
      }
      """#
    ))

  public var request: VerifyRequest

  public init(request: VerifyRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("verify", Bool.self, arguments: ["request": .variable("request")]),
    ] }

    public var verify: Bool { __data["verify"] }
  }
}
