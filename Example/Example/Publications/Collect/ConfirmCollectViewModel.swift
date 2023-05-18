import SwiftUI
import Foundation
import Lens

final class ConfirmCollectViewModel: ObservableObject {
    // MARK: - Properties

    @Published var isCollecting: Bool = false

    var title: String? {
        publication.metadata.name
    }

    var description: String? {
        publication.metadata.description ?? publication.metadata.content
    }

    var mediaImageUrl: URL? {
        // TODO: Support multiple images
        guard let media = publication.metadata.media.first?.original else { return nil }
        // TODO: Support audio and video
        guard
            let mimeType = media.mimeType,
            let mediaType = MediaType.fromMimeType(mimeType),
            mediaType == .image
        else {
            return nil
        }

        return media.url.toIpfsUrl()
    }

    let publication: Publication
    let onCollectComplete: (String) -> Void

    // MARK: - Object life cycle

    init(publication: Publication, onCollectComplete: @escaping (String) -> Void) {
        self.publication = publication
        self.onCollectComplete = onCollectComplete
    }

    // MARK: - Internal interface

    @MainActor
    func didTapConfirmButton() async {
        isCollecting = true

        do {
            let request = CreateCollectRequest(publicationId: publication.publicationId)
            let response = try await Current.publications.createCollectTypedData(request: request)
            let signature = try await Current.wallet.signTypedDataV4(response.typedData)

            let broadcastRequest = BroadcastRequest(id: response.broadcastId, signature: signature)
            let txHash = try await Current.transactions.broadcast(request: broadcastRequest)
            onCollectComplete(txHash)
        } catch {
            // TODO: Display collect error mesage in UI
        }

        isCollecting = false
    }
}
