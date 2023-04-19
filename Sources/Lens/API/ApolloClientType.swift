import Apollo
import Foundation

protocol ApolloClientType {
    @discardableResult
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        contextIdentifier: UUID?,
        queue: DispatchQueue,
        resultHandler: GraphQLResultHandler<Query.Data>?
    ) -> Cancellable

    @discardableResult
    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool,
        queue: DispatchQueue,
        resultHandler: GraphQLResultHandler<Mutation.Data>?)
    -> Cancellable
}

extension ApolloClient: ApolloClientType {}
