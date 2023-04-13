import Foundation

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
