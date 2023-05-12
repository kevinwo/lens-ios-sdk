import Kingfisher
import SwiftUI

extension KFImage {
    // MARK: - Internal interface

    func feedProfilePicture() -> some View {
        self
            .resizable()
            .downsampling(
                size: .init(
                    width: MediaView.Constants.feedProfileFrameSize.width,
                    height: MediaView.Constants.feedProfileFrameSize.height
                )
            )
            .placeholder { _ in
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: MediaView.Constants.feedProfileFrameSize.width)
            }
            .frame(
                width: MediaView.Constants.feedProfileFrameSize.width,
                height: MediaView.Constants.feedProfileFrameSize.height
            )
            .clipShape(Circle())
            .fixedSize(horizontal: true, vertical: true)
            .aspectRatio(contentMode: .fill)
    }

    func profilePicture() -> some View {
        self
            .resizable()
            .downsampling(
                size: .init(
                    width: MediaView.Constants.profileFrameSize.width,
                    height: MediaView.Constants.profileFrameSize.height
                )
            )
            .placeholder { _ in
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: MediaView.Constants.profileFrameSize.width)
            }
            .frame(
                width: MediaView.Constants.profileFrameSize.width,
                height: MediaView.Constants.profileFrameSize.height
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
                    .cornerRadius(MediaView.Constants.mediaImageCornerRadius)
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
