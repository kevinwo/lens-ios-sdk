import Foundation
import Lens

final class UserNftDetailViewModel: ObservableObject {
    // MARK: - Properties

    var title: String {
        nft.name
    }

    var description: String {
        nft.description
    }

    let nft: NFT

    init(nft: NFT) {
        self.nft = nft
    }
}
