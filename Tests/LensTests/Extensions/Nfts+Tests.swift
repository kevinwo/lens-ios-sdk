import Foundation
import Lens
import XCTest

extension NftsResponse: Equatable {
    public static func == (lhs: NftsResponse, rhs: NftsResponse) -> Bool {
        lhs.items.map { "\($0.contractAddress) \($0.tokenId)" } == rhs.items.map { "\($0.contractAddress) \($0.tokenId)" }
    }
}
