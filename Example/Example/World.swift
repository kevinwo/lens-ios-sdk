import Foundation
import Lens

struct World {
    var authentication: AuthenticationType = Authentication()
    var explore: ExploreType = Explore()
    var feed: FeedType = Feed()
}

#if DEBUG
var Current = World()
#else
let Current = World()
#endif
