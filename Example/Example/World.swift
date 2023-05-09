import Foundation
import Lens

struct World {
    var user: CurrentUser = CurrentUser()
    var authentication: AuthenticationType = Authentication()
    var explore: ExploreType = Explore()
    var feed: FeedType = Feed()
    var profiles: ProfilesType = Profiles()
    var publications: PublicationsType = Publications()
    var reactions: ReactionsType = Reactions()
    #if os(macOS)
    var wallet: WalletType = MacWallet()
    #else
    var wallet: WalletType = Wallet()
    #endif
    var transactions = Transactions()
    var nfts = Nfts()
}

#if DEBUG
var Current = World()
#else
let Current = World()
#endif
