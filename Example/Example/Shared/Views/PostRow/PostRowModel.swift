import Foundation
import Lens

final class PostRowModel {
    enum MediaType {
        case image
        case audio
        case video

        static func fromMimeType(_ mimeType: String) -> MediaType? {
            switch mimeType {
            case "image/gif", "image/jpeg", "image/png", "image/tiff", "image/x-ms-bmp", "image/svg+xml", "image/webp":
                return .image
            case "audio/wav", "audio/mpeg", "audio/ogg":
                return .audio
            case "video/webm", "video/mp4", "video/x-m4v", "video/ogv", "video/ogg":
                return .video
            default:
                return nil
            }
        }
    }

    // MARK: - Properties

    let post: Post

    var authorProfileImageUrl: URL? {
        guard let urlString = post.profile.picture?.asMediaSet?.original.url else {
            return nil
        }
        return URL(string: urlString)
    }

    var authorName: String? {
        post.profile.name
    }

    var authorHandle: String {
        "@\(post.profile.handle)"
            .replacingOccurrences(of: ".test", with: "")
            .replacingOccurrences(of: ".lens", with: "")
    }

    var timeAgo: String? {
        guard let date = Formatter.isoDateFormatter.date(from: post.createdAt) else { return nil }
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
        post.metadata.content ?? ""
    }

    var mediaType: MediaType? {
        // TODO: Support multiple media types
        guard let mimeType = post.metadata.media.first?.original.mimeType else { return nil }
        return MediaType.fromMimeType(mimeType)
    }

    var mediaImageUrl: URL? {
        // TODO: Support multiple images
        guard let media = post.metadata.media.first?.original else { return nil }
        // TODO: Support audio and video
        guard
            let mimeType = media.mimeType,
            let mediaType = MediaType.fromMimeType(mimeType),
            mediaType == .image
        else {
            return nil
        }

        return URL(string: media.url.replacingOccurrences(of: "ipfs://", with: "https://ipfs.io/ipfs/"))
    }

    // MARK: - Object life cycle

    init(post: Post) {
        self.post = post
    }
}
