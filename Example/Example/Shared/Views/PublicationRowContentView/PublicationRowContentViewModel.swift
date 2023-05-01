import Foundation
import Lens

final class PublicationRowContentViewModel {
    // MARK: - Properties

    let publication: Publication
    let isMainPostForComment: Bool

    var authorProfileImageUrl: URL? {
        guard let urlString = publication.profile.picture?.asMediaSet?.original.url else {
            return nil
        }
        return urlString.toIpfsUrl()
    }

    var authorId: String {
        publication.profile.id
    }

    var authorName: String? {
        publication.profile.name
    }

    var authorHandle: String {
        "@\(publication.profile.handle.asPrettyHandle)"
    }

    var timeAgo: String? {
        guard let date = Formatter.isoDateFormatter.date(from: publication.createdAt) else { return nil }
        let now = Date()
        let difference = Calendar.current.dateComponents([.day, .hour, .minute], from: date, to: now)

        if difference.day ?? 0 > 0 {
            return Formatter.daysFormatter.string(from: difference)
        } else if difference.hour ?? 0 > 0 {
            return Formatter.hoursFormatter.string(from: difference)
        } else {
            return Formatter.minutesFormatter.string(from: difference)
        }
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

    var stats: PublicationStats {
        publication.stats
    }

    // MARK: - Object life cycle

    init(publication: Publication, isMainPostForComment: Bool) {
        self.publication = publication
        self.isMainPostForComment = isMainPostForComment
    }
}
