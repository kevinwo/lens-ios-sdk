import Apollo
import ApolloAPI
import Foundation

protocol LensClientType {
    func request<Query: GraphQLQuery>(query: Query) async throws -> Query.Data
}

struct LensClient: LensClientType {
    // MARK: - Enums

    enum Error: Swift.Error {
        case invalidData
    }

    // MARK: - Properties

    private let apolloClient: ApolloClientType = Current.apolloClient

    // MARK: - Internal interface

    func request<Query: GraphQLQuery>(query: Query) async throws -> Query.Data {
        return try await withCheckedThrowingContinuation { continuation in
            apolloClient.fetch(
                query: query,
                cachePolicy: .default,
                contextIdentifier: nil,
                queue: .main
            ) { result in
                switch result {
                case .success(let result):
                    guard let data = result.data else {
                        continuation.resume(with: .failure(Error.invalidData))
                        return
                    }
                    continuation.resume(with: .success(data))
                case .failure(let error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}
