import Foundation
import Lens

struct World {
    var authentication: AuthenticationType = Authentication()
    var explore: ExploreType = Explore()
    var feed: FeedType = Feed()
    var profiles: ProfilesType = Profiles()
    var wallet: WalletType = Wallet()
}

#if DEBUG
var Current = World()
#else
let Current = World()
#endif
