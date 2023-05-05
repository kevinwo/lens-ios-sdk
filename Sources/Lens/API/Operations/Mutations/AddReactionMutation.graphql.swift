// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddReactionMutation: GraphQLMutation {
  public static let operationName: String = "addReaction"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation addReaction($request: ReactionRequest!) {
        addReaction(request: $request)
      }
      """#
    ))

  public var request: ReactionRequest

  public init(request: ReactionRequest) {
    self.request = request
  }

  public var __variables: Variables? { ["request": request] }

  public struct Data: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("addReaction", Lens.CustomScalarVoid?.self, arguments: ["request": .variable("request")]),
    ] }

    public var addReaction: Lens.CustomScalarVoid? { __data["addReaction"] }
  }
}
