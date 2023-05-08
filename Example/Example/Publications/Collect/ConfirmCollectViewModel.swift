import SwiftUI
import Foundation
import Lens

final class ConfirmCollectViewModel: ObservableObject {
    // MARK: - Properties

    @Published var isCollecting: Bool = false

    var title: String? {
        publication.metadata.name
    }

    var content: String? {
        publication.metadata.content
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
