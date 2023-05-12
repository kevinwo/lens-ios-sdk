import Kingfisher
import SwiftUI

enum ImageViewMedia {
    case staticImage(String, Preset?)
    case svg(String)
    case empty

    enum Preset {
        case mediaImage
    }

    static func from(uri: String, type: String, preset: Preset? = nil) -> ImageViewMedia {
        if type.contains("svg") || uri.contains("svg+xml") {
            return .svg(uri)
        } else {
            return .staticImage(uri, preset)
        }
    }
}

struct ImageView: View {
    let media: ImageViewMedia
    let aspectRatio: CGFloat?
    let contentMode: SwiftUI.ContentMode

    init(media: ImageViewMedia, aspectRatio: CGFloat? = nil, contentMode: SwiftUI.ContentMode = .fill) {
        self.media = media
        self.aspectRatio = aspectRatio
        self.contentMode = contentMode
    }

    var body: some View {
        switch media {
        case let .staticImage(uri, preset):
            VStack {
                KFImage(uri.toIpfsUrl())
                    .preset(preset)
            }
            .aspectRatio(aspectRatio, contentMode: contentMode)
        case let .svg(svg):
            Text("SVG TBD")
        case .empty:
            Rectangle()
                .foregroundColor(.gray)
        }
    }
}

extension KFImage {
    func preset(_ preset: ImageViewMedia.Preset?) -> some View {
        switch preset {
        case .mediaImage:
            return self
                .mediaImage()
                .typeErased
        case .none:
            return self.typeErased
        }
    }
}
