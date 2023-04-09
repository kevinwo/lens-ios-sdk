import Lens
import ApolloAPI

class MockChallengeQuery: GraphQLQuery {
    public static let operationName: String = "Challenge"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
        definition: .init(
      #"""
      query Challenge($request: ChallengeRequest!) {
        challenge(request: $request) {
          __typename
          message
        }
      }
      """#
        ))

    public var request: ChallengeRequest

    public init(request: ChallengeRequest) {
        self.request = request
    }

    public var __variables: Variables? { ["request": request] }

    public struct Data: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Query }
        public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("message", String.self),
        ] }

        public var message: String { __data["message"] }
    }
}
