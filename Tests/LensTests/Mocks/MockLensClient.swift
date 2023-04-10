import Foundation
@testable import Lens

final class MockLensClient: LensClientType {
    enum Error: Swift.Error {
        case invalidData
    }

    var invokedRequest: Bool = false
    var stubbedRequestData: Any?

    func stubRequestData<Query: GraphQLQuery>(_ data: Query.Data, forQuery: Query) {
        stubbedRequestData = data
    }

    func request<Query>(query: Query) async throws -> Query.Data where Query : GraphQLQuery {
        invokedRequest = true

        if let data = stubbedRequestData as? Query.Data {
            return data
        } else {
            throw Error.invalidData
        }
    }
}
