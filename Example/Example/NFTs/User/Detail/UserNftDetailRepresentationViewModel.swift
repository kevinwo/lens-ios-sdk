import EFQRCode
import Foundation
import UIKit

final class UserNftDetailRepresentationViewModel: ObservableObject {
    var qrCodeImage: CGImage? {
        let content = "\(contractAddress)-\(tokenId)"
        return EFQRCode.generate(for: content)
    }

    let title: String
    let subtitle: String
    let mediaUri: String
    let mediaType: String
    let contractAddress: String
    let tokenId: String

    init(title: String, subtitle: String, mediaUri: String, mediaType: String, contractAddress: String, tokenId: String) {
        self.title = title
        self.subtitle = subtitle
        self.mediaUri = mediaUri
        self.mediaType = mediaType
        self.contractAddress = contractAddress
        self.tokenId = tokenId
    }
}
