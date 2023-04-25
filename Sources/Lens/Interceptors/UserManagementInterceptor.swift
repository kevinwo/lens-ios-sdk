import Apollo
import Foundation

final class UserManagementInterceptor: ApolloInterceptor {
    // MARK: - Enums

    enum UserError: Error {
        case noUserLoggedIn
    }

    // MARK: - Properties

    private let authentication: AuthenticationType & AuthenticationTypeInternal

    // MARK: - Object life cycle

    init(authentication: AuthenticationType & AuthenticationTypeInternal = Authentication()) {
        self.authentication = authentication
    }

    // MARK: - Internal interface

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        /**
         We don't want to go through the usual auth token management if the incoming request is to refresh the auth tokens (if we do, it will cause in infinite loop of refreshing tokens). Therefore, we first check to see if this is refresh request, and if it is, we skip and continue down the interceptor chain. There is probably a more elegant way to handle this using an additional interceptor, but will give this a go for now.
         */
        guard isNotRefresh(request) else {
            chain.proceedAsync(
                request: request,
                response: response,
                completion: completion
            )
            return
        }

        Task {
            do {
                let token = try await accessToken()

                addTokenAndProceed(
                    token,
                    to: request,
                    chain: chain,
                    response: response,
                    completion: completion
                )
            } catch {
                chain.proceedAsync(
                    request: request,
                    response: response,
                    completion: completion
                )
            }
        }
    }

    // MARK: - Private interface

    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: String?,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        if let token {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }
        chain.proceedAsync(
            request: request,
            response: response,
            completion: completion
        )
    }

    private func accessToken() async throws -> String? {
        guard let currentAccessToken = authentication.accessToken else {
            return nil
        }

        let token = try JSONWebToken(currentAccessToken)

        guard token.isExpired else {
            return currentAccessToken
        }

        return try await authentication.refresh()
    }

    private func isNotRefresh<Operation: GraphQLOperation>(_ request: HTTPRequest<Operation>) -> Bool {
        !(request.operation is RefreshMutation)
    }
}
