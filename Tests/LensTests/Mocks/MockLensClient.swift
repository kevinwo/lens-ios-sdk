import Foundation
@testable import Lens

final class MockLensClient: LensClientType {
    enum Error: Swift.Error {
        case invalidData
    }

    /// Given that our GraphQL interceptor pipeline involves a potential auth token refresh, and we may want to verify various behavior in tests based on a refreshed access token, we can use this to force a refresh during a given request.
    var forceAuthRefreshHandler: (() -> Void)?

    // MARK: - request query

    var invokedRequestQuery: Bool = false
    var stubbedRequestQueryData: Any?

    func stubRequestQueryData<Query: GraphQLQuery>(_ data: Query.Data, forQuery: Query) {
        stubbedRequestQueryData = data
    }

    func request<Query>(query: Query) async throws -> Query.Data where Query : GraphQLQuery {
        invokedRequestQuery = true
        forceAuthRefreshHandler?()

        if let data = stubbedRequestQueryData as? Query.Data {
            return data
        } else {
            throw Error.invalidData
        }
    }

    // MARK: - request mutation

    var invokedRequestMutation: Bool = false
    var stubbedRequestMutationData: Any?

    func stubRequestMutationData<Mutation: GraphQLMutation>(_ data: Mutation.Data, forMutation: Mutation) {
        stubbedRequestMutationData = data
    }

    func request<Mutation>(mutation: Mutation) async throws -> Mutation.Data where Mutation : ApolloAPI.GraphQLMutation {
        invokedRequestMutation = true
        forceAuthRefreshHandler?()

        if let data = stubbedRequestMutationData as? Mutation.Data {
            return data
        } else {
            throw Error.invalidData
        }
    }
}
