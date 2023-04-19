import Apollo

final class LensInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors: [ApolloInterceptor] = [
            OriginInterceptor(),
            UserManagementInterceptor()
        ]
        interceptors.append(contentsOf: super.interceptors(for: operation))
        return interceptors
    }
}
