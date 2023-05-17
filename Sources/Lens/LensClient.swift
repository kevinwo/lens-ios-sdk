import Apollo
import ApolloAPI
import Foundation

protocol LensClientType {
    func request<Query: GraphQLQuery>(query: Query, cachePolicy: CachePolicy) async throws -> Query.Data
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

    // MARK: - Public interface

    /**
     Configure how the SDK should identify your app when performing various actions.
     - Parameters:
        - appName: The name of your app; used when generating a sign-in message for authentication
        - appBundleIdentifier: The bundle identifier of your app (optional); used when configuring the Keychain namespace for storing credentials
     */
    public static func configure(appName: String, appBundleIdentifier: String? = Bundle.main.bundleIdentifier) {
        self.appName = appName
        self.appBundleIdentifier = appBundleIdentifier
    }

    // MARK: - Internal interface

    func request<Query: GraphQLQuery>(query: Query, cachePolicy: CachePolicy = .default) async throws -> Query.Data {
        return try await withCheckedThrowingContinuation { continuation in
            Current.apolloClient.fetch(
                query: query,
                cachePolicy: cachePolicy,
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
            Current.apolloClient.perform(
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
