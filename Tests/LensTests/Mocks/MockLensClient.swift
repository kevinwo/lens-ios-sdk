import Foundation
@testable import Lens

final class MockLensClient: LensClientType {
    enum Error: Swift.Error {
        case invalidData
    }

    // MARK: - request query

    var invokedRequestQuery: Bool = false
    var stubbedRequestQueryData: Any?

    func stubRequestQueryData<Query: GraphQLQuery>(_ data: Query.Data, forQuery: Query) {
        stubbedRequestQueryData = data
    }

    func request<Query>(query: Query) async throws -> Query.Data where Query : GraphQLQuery {
        invokedRequestQuery = true

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

        if let data = stubbedRequestMutationData as? Mutation.Data {
            return data
        } else {
            throw Error.invalidData
        }
    }
}
