import Apollo
import ApolloAPI

final class MockRequestChain: RequestChain {
    func kickoff<Operation>(request: Apollo.HTTPRequest<Operation>, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {}

    var invokedProceedAsync = false
    var invokedProceedAsyncRequest: Any?
    var invokedProceedAsyncResponse: Any?
    var invokedProceedAsyncCompletion: Any?
    var stubbedProceedAsyncCompletionResult: Any?

    func proceedAsync<Operation>(request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {
        invokedProceedAsync = true
        invokedProceedAsyncRequest = request
        invokedProceedAsyncResponse = response
        invokedProceedAsyncCompletion = completion
        if let result = stubbedProceedAsyncCompletionResult as? Apollo.GraphQLResult<Operation.Data> {
            completion(.success(result))
        }
    }

    func cancel() {}

    func retry<Operation>(request: Apollo.HTTPRequest<Operation>, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {}

    func handleErrorAsync<Operation>(_ error: Error, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {}

    func returnValueAsync<Operation>(for request: Apollo.HTTPRequest<Operation>, value: Apollo.GraphQLResult<Operation.Data>, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {}

    var isCancelled: Bool = false
}
