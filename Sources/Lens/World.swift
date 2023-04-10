import Apollo
import Foundation

struct World {
    var apolloClient: ApolloClientType = ApolloClient(url: URL(string: "https://api-mumbai.lens.dev")!)
    var lensClient: () -> LensClientType = { LensClient() }
}

#if DEBUG
var Current = World()
#else
let Current = World()
#endif
