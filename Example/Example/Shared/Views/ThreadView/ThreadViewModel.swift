import Foundation
import Lens

final class ThreadViewModel: ObservableObject {
    // MARK: - Properties

    var authorProfileImageUrl: URL? {
        guard let urlString = publication.profile.picture?.asMediaSet?.original.url else {
            return nil
        }
        return urlString.toIpfsUrl()
    }

    var authorName: String? {
        publication.profile.name
    }

    var authorHandle: String {
        "@\(publication.profile.handle.asPrettyHandle)"
    }

    var content: String {
        publication.metadata.content ?? ""
    }

    var mediaType: MediaType? {
        // TODO: Support multiple media types
        guard let mimeType = publication.metadata.media.first?.original.mimeType else { return nil }
        return MediaType.fromMimeType(mimeType)
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

    private let publication: Publication

    // MARK: - Object life cycle

    init(publication: Publication) {
        self.publication = publication
    }
}
