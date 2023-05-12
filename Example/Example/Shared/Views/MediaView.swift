import Kingfisher
import SVGView
import SwiftUI

struct MediaView: View {
    // MARK: - Enums

    enum Constants {
        static let feedProfileFrameSize = CGSize(width: 36, height: 36)
        static let profileFrameSize = CGSize(width: 64, height: 64)
        static let mediaImageCornerRadius: CGFloat = 10
    }

    enum Media {
        case staticImage(String)
        case svgData(String)
        case svg(String)
        case empty

        static func from(uri: String, type: String?) -> Media {
            if uri.contains("svg+xml") {
                return .svgData(uri)
            } else if let type, type.contains("svg") || uri.contains(".svg") {
                /// Media type unfortunately cannot be trusted in the case of incorrect MIME types returned from the API, so we need to also check the URI itself for the extension.
                return .svg(uri)
            } else {
                return .staticImage(uri)
            }
        }
    }

    enum Preset {
        case mediaImage
        case feedProfilePicture
        case profilePicture
        case coverPicture(GeometryProxy)
        case ticket
    }

    // MARK: - Properties

    let media: Media
    let preset: Preset?
    let aspectRatio: CGFloat?
    let contentMode: SwiftUI.ContentMode

    init(
        media: Media?,
        preset: Preset? = nil,
        aspectRatio: CGFloat? = nil,
        contentMode: SwiftUI.ContentMode = .fill
    ) {
        self.media = media ?? .empty
        self.preset = preset
        self.aspectRatio = aspectRatio
        self.contentMode = contentMode
    }

    var body: some View {
        VStack {
            switch media {
            case let .staticImage(uri):
                KFImage(uri.toIpfsUrl())
                    .preset(preset)
            case let .svgData(encodedData):
                if let data = svgData(from: encodedData) {
                    SVGView(data: data)
                        .preset(preset)
                } else {
                    empty
                }
            case let .svg(uri):
                if let url = uri.toIpfsUrl() {
                    // TODO: Replace this with Kingfisher SVG image processing
                    SVGView(contentsOf: url)
                        .preset(preset)
                } else {
                    empty
                }
            case .empty:
                KFImage(nil)
                    .preset(preset)
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
        case .feedProfilePicture:
            return self
                .feedProfilePicture()
                .typeErased
        case .profilePicture:
            return self
                .profilePicture()
                .typeErased
        case .coverPicture(let geometry):
            return self
                .coverPicture(geometry: geometry)
                .typeErased
        case .ticket:
            return self
                .ticket()
                .typeErased
        case .none:
            return self.typeErased
        }
    }
}

extension View {
    func preset(_ preset: MediaView.Preset?) -> some View {
        switch preset {
        case .mediaImage:
            return self
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .clipped()
                .typeErased
        case .feedProfilePicture:
            return self
                .frame(
                    width: MediaView.Constants.feedProfileFrameSize.width,
                    height: MediaView.Constants.feedProfileFrameSize.height
                )
                .clipShape(Circle())
                .fixedSize(horizontal: true, vertical: true)
                .aspectRatio(contentMode: .fill)
                .typeErased
        case .profilePicture:
            return self
                .frame(
                    width: MediaView.Constants.profileFrameSize.width,
                    height: MediaView.Constants.profileFrameSize.height
                )
                .fixedSize(horizontal: true, vertical: true)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .typeErased
        case .coverPicture(let geometry):
            return self
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                .clipped()
                .typeErased
        case .ticket:
            return self
                .aspectRatio(contentMode: .fill)
                .frame(height: 100)
                .clipped()
                .typeErased
        case .none:
            return self.typeErased
        }
    }
}
