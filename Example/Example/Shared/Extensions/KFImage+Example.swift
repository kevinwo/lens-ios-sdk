import Kingfisher
import SwiftUI

extension KFImage {
    // MARK: - Enums

    enum Constants {
        static let profileFrameSize = CGSize(width: 36, height: 36)
        static let profilePictureCornerRadius: CGFloat = 36
        static let mediaImageCornerRadius: CGFloat = 10
    }

    // MARK: - Internal interface

    func profilePicture() -> some View {
        self
            .resizable()
            .downsampling(size: .init(width: Constants.profileFrameSize.width, height: Constants.profileFrameSize.height))
            .roundCorner(radius: .point(Constants.profilePictureCornerRadius))
            .placeholder { _ in
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: Constants.profileFrameSize.width)
            }
            .fixedSize(horizontal: true, vertical: true)
            .aspectRatio(contentMode: .fit)
    }

    func mediaImage() -> some View {
        self
            .resizable()
            .roundCorner(radius: .point(Constants.mediaImageCornerRadius))
            .placeholder { _ in
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(Constants.mediaImageCornerRadius)
            }
            .aspectRatio(contentMode: .fit)
    }
}
