import Foundation

public class Metadata: Codable {
    public let name: String?
    public let description: String?
    public let content: String?
    public let media: [MediaSet]

    init(metadata: any AnyMetadata) {
        self.name = metadata.content
        self.description = metadata.description
        self.content = metadata.content
        self.media = metadata.media.compactMap { MediaSet(mediaSet: $0) }
    }
}
