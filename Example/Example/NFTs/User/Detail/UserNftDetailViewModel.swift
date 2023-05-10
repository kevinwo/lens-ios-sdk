import Foundation
import Lens

final class UserNftDetailViewModel: ObservableObject {
    // MARK: - Enums

    enum ViewType: CaseIterable, Identifiable {
        case info
        case ticket
        case coupon
        case key

        var id: String {
            title
        }

        var title: String {
            switch self {
            case .info:
                return "Info"
            case .ticket:
                return "Ticket"
            case .coupon:
                return "Coupon"
            case .key:
                return "Key"
            }
        }
    }

    // MARK: - Properties

    @Published var viewType: ViewType = .info

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
