import Kingfisher
import SwiftUI

extension KFImage {
    // MARK: - Enums

    enum Constants {
        static let feedProfileFrameSize = CGSize(width: 36, height: 36)
        static let profileFrameSize = CGSize(width: 64, height: 64)
        static let mediaImageCornerRadius: CGFloat = 10
    }

    // MARK: - Internal interface

    func feedProfilePicture() -> some View {
        self
            .resizable()
            .downsampling(size: .init(width: Constants.feedProfileFrameSize.width, height: Constants.feedProfileFrameSize.height))
            .placeholder { _ in
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: Constants.feedProfileFrameSize.width)
            }
            .frame(
                width: Constants.feedProfileFrameSize.width,
                height: Constants.feedProfileFrameSize.height
            )
            .clipShape(Circle())
            .fixedSize(horizontal: true, vertical: true)
            .aspectRatio(contentMode: .fill)
    }

    func profilePicture() -> some View {
        self
            .resizable()
            .downsampling(size: .init(width: Constants.profileFrameSize.width, height: Constants.profileFrameSize.height))
            .placeholder { _ in
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: Constants.profileFrameSize.width)
            }
            .frame(
                width: Constants.profileFrameSize.width,
                height: Constants.profileFrameSize.height
            )
            .fixedSize(horizontal: true, vertical: true)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }

    func coverPicture(geometry: GeometryProxy) -> some View {
        self
            .resizable()
            .placeholder { _ in
                Rectangle()
                    .foregroundColor(.gray)
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
            .clipped()
    }

    func mediaImage(contentMode: SwiftUI.ContentMode = .fill) -> some View {
        self
            .resizable()
            .placeholder { _ in
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(Constants.mediaImageCornerRadius)
            }
            .aspectRatio(contentMode: contentMode)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipped()
    }

    func ticket() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 100)
            .clipped()
    }
}
