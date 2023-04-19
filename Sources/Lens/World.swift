import Apollo
import Foundation

struct World {
    var apolloClient: ApolloClientType = {
        let store = ApolloStore()
        let provider = LensInterceptorProvider(store: store)
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: URL(string: "https://api-mumbai.lens.dev")!
        )
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
    var lensClient: () -> LensClientType = { LensClient() }
    var keychain: () -> KeychainType = { Keychain() }
}

#if DEBUG
var Current = World()
#else
let Current = World()
#endif
