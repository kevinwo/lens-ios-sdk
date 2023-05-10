import Foundation
import Lens

final class UserNftsGridItemViewModel: ObservableObject {
    // MARK: - Properties

    var mediaUrl: URL? {
        nft.originalContent.uri.toIpfsUrl()
    }

    var title: String {
        nft.name
    }

    var subtitle: String {
        !nft.description.isEmpty ? nft.description : nft.collectionName
    }

    private let nft: NFT

    // MARK: - Object life cycle

    init(nft: NFT) {
        self.nft = nft
    }
}
