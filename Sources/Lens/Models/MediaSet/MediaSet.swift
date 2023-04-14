import Foundation

public class MediaSet: Codable {
    public class Original: Codable {
        public let url: URL
        public let mimeType: String?

        init?(media: any AnyMedia) {
            guard let url = URL(string: media.url) else {
                return nil
            }

            self.url = url
            self.mimeType = media.mimeType
        }
    }

    public let original: Original?

    init?(mediaSet: (any AnyMediaSet)?) {
        guard let mediaSet else { return nil }
        self.original = Original(media: mediaSet.original)
    }
}
