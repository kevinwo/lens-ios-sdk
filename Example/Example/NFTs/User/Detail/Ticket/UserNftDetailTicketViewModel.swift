import EFQRCode
import Foundation
import UIKit

final class UserNftDetailTicketViewModel: ObservableObject {
    var qrCodeImage: CGImage? {
        let content = "\(contractAddress)-\(tokenId)"
        return EFQRCode.generate(for: content)
    }

    let title: String
    let subtitle: String
    let imageUri: String
    let contractAddress: String
    let tokenId: String

    init(title: String, subtitle: String, imageUri: String, contractAddress: String, tokenId: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageUri = imageUri
        self.contractAddress = contractAddress
        self.tokenId = tokenId
    }
}
