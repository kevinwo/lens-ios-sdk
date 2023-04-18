import Apollo

public class LensInterceptorProvider: DefaultInterceptorProvider {
    public override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors: [ApolloInterceptor] = [OriginInterceptor()]
        interceptors.append(contentsOf: super.interceptors(for: operation))
        return interceptors
    }
}
