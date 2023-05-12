import Foundation
import Lens

final class ThreadViewModel: ObservableObject {
    // MARK: - Properties

    var authorProfileMedia: MediaView.Media? {
        guard let mediaSet = publication.profile.picture?.asMediaSet?.original else {
            return nil
        }
        return .from(uri: mediaSet.url, type: mediaSet.mimeType)
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

    var media: MediaView.Media? {
        guard
            let uri = mediaImageUri,
            let type = mediaImageType
        else {
            return nil
        }

        return .from(uri: uri, type: type)
    }

    private var mediaImageUri: String? {
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

        return media.url
    }

    private var mediaImageType: String? {
        publication.metadata.media.first?.original.mimeType
    }

    private var mediaType: MediaType? {
        // TODO: Support multiple media types
        guard let mimeType = publication.metadata.media.first?.original.mimeType else { return nil }
        return MediaType.fromMimeType(mimeType)
    }

    private let publication: Publication

    // MARK: - Object life cycle

    init(publication: Publication) {
        self.publication = publication
    }
}
