import Foundation
import Lens

struct World {
    var explore: ExploreType = Explore()
}

#if DEBUG
var Current = World()
#else
let Current = World()
#endif
