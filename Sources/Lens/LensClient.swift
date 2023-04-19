import Apollo
import ApolloAPI
import Foundation

protocol LensClientType {
    func request<Query: GraphQLQuery>(query: Query) async throws -> Query.Data
    func request<Mutation: GraphQLMutation>(mutation: Mutation) async throws -> Mutation.Data
}

public struct LensClient: LensClientType {
    // MARK: - Enums

    enum Error: Swift.Error {
        case invalidData
    }

    // MARK: - Properties

    static var appName: String?
    static var appBundleIdentifier: String?

    private let apolloClient: ApolloClientType = Current.apolloClient

    // MARK: - Public interface

    public static func configure(appName: String, appBundleIdentifier: String? = Bundle.main.bundleIdentifier) {
        self.appName = appName
        self.appBundleIdentifier = appBundleIdentifier
    }

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

    func request<Mutation: GraphQLMutation>(mutation: Mutation) async throws -> Mutation.Data {
        return try await withCheckedThrowingContinuation { continuation in
            apolloClient.perform(
                mutation: mutation,
                publishResultToStore: true,
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
