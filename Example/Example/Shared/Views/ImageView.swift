import Kingfisher
import SVGView
import SwiftUI

struct MediaView: View {
    // MARK: - Enums

    enum Media {
        case staticImage(String, Preset?)
        case svg(String)
        case empty

        static func from(uri: String, type: String, preset: Preset? = nil) -> Media {
            if type.contains("svg") || uri.contains("svg+xml") {
                return .svg(uri)
            } else {
                return .staticImage(uri, preset)
            }
        }
    }

    enum Preset {
        case mediaImage
    }

    // MARK: - Properties

    let media: Media
    let aspectRatio: CGFloat?
    let contentMode: SwiftUI.ContentMode

    init(media: Media, aspectRatio: CGFloat? = nil, contentMode: SwiftUI.ContentMode = .fill) {
        self.media = media
        self.aspectRatio = aspectRatio
        self.contentMode = contentMode
    }

    var body: some View {
        VStack {
            switch media {
            case let .staticImage(uri, preset):
                KFImage(uri.toIpfsUrl())
                    .preset(preset)
            case let .svg(svg):
                if let data = svgData(from: svg) {
                    SVGView(data: data)
                } else {
                    empty
                }
            case .empty:
                empty
            }
        }
        .aspectRatio(aspectRatio, contentMode: contentMode)
    }

    private var empty: some View {
        Rectangle()
            .foregroundColor(.gray)
    }

    // MARK: - Private interface

    private func svgData(from svg: String) -> Data? {
        let string = svg.replacingOccurrences(of: "data:image/svg+xml;base64,", with: "")

        return Data(base64Encoded: string)
    }
}

extension KFImage {
    func preset(_ preset: MediaView.Preset?) -> some View {
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
