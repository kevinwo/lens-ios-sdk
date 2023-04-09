import Apollo
import Foundation

protocol ApolloClientType {
    @discardableResult func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        contextIdentifier: UUID?,
        queue: DispatchQueue,
        resultHandler: GraphQLResultHandler<Query.Data>?
    ) -> Cancellable
}

extension ApolloClient: ApolloClientType {}
