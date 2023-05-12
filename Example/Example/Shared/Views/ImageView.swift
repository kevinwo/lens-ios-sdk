import Kingfisher
import SVGView
import SwiftUI

struct MediaView: View {
    // MARK: - Enums

    enum Media {
        case staticImage(String, Preset?)
        case svgData(String)
        case svg(String)
        case empty

        static func from(uri: String, type: String, preset: Preset? = nil) -> Media {
            if uri.contains("svg+xml") {
                return .svgData(uri)
            } else if type.contains("svg") || uri.contains(".svg") {
                /// Media type unfortunately cannot be trusted in the case of incorrect MIME types returned from the API, so we need to also check the URI itself for the extension.
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
            case let .svgData(encodedData):
                if let data = svgData(from: encodedData) {
                    SVGView(data: data)
                } else {
                    empty
                }
            case let .svg(uri):
                if let url = uri.toIpfsUrl() {
                    // TODO: Replace this with Kingfisher SVG image processing
                    SVGView(contentsOf: url)
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
