import Apollo

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
        guard let token = authentication.accessToken else {
            chain.handleErrorAsync(
                UserError.noUserLoggedIn,
                request: request,
                response: response,
                completion: completion
            )
            return
        }

        // TODO: Handle token renewal
        self.addTokenAndProceed(
            token,
            to: request,
            chain: chain,
            response: response,
            completion: completion
        )
    }

    /// Helper function to add the token then move on to the next step
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: String,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        chain.proceedAsync(
            request: request,
            response: response,
            completion: completion
        )
    }
}
