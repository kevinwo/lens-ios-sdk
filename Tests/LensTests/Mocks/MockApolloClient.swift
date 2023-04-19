import Apollo
import Foundation
@testable import Lens

class MockApolloClient: ApolloClientType {
    enum Error: Swift.Error {
        case invalidResult
    }

    // MARK: - fetch

    var invokedFetch = false
    var stubbedFetchResult: Any?

    func stubFetchResult<Query: GraphQLQuery>(_ result: Query.Data, forQuery: Query) {
        stubbedFetchResult = result
    }

    func fetch<Query>(query: Query, cachePolicy: CachePolicy, contextIdentifier: UUID?, queue: DispatchQueue, resultHandler: GraphQLResultHandler<Query.Data>?) -> Cancellable where Query : GraphQLQuery {
        invokedFetch = true

        if let data = stubbedFetchResult as? Query.Data {
            let result = GraphQLResult(data: data, extensions: nil, errors: nil, source: .server, dependentKeys: nil)
            resultHandler?(.success(result))
        } else {
            resultHandler?(.failure(Error.invalidResult))
        }

        return EmptyCancellable()
    }

    // - MARK: - perform

    var invokedPerform = false
    var stubbedPerformResult: Any?

    func stubPerformResult<Mutation: GraphQLMutation>(_ result: Mutation.Data, forMutation: Mutation) {
        stubbedPerformResult = result
    }

    func perform<Mutation>(mutation: Mutation, publishResultToStore: Bool, queue: DispatchQueue, resultHandler: Apollo.GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable where Mutation : ApolloAPI.GraphQLMutation {
        invokedPerform = true

        if let data = stubbedPerformResult as? Mutation.Data {
            let result = GraphQLResult(data: data, extensions: nil, errors: nil, source: .server, dependentKeys: nil)
            resultHandler?(.success(result))
        } else {
            resultHandler?(.failure(Error.invalidResult))
        }

        return EmptyCancellable()
    }
}
