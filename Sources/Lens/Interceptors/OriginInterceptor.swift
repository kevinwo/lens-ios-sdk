import Apollo

final class OriginInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        if let appName = LensClient.appName {
            request.addHeader(name: "Origin", value: appName)
        }

        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
