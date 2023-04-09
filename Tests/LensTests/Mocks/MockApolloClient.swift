import Apollo
import Foundation
@testable import Lens

class MockApolloClient: ApolloClientType {
    enum Error: Swift.Error {
        case invalidResult
    }

    var invokedFetch: Bool = false
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
}
