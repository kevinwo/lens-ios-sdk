import Kingfisher
import SwiftUI

extension KFImage {
    // MARK: - Enums

    enum Constants {
        static let profileFrameSize = CGSize(width: 36, height: 36)
    }

    // MARK: - Internal interface

    func profilePicture() -> some View {
        self
            .resizable()
            .downsampling(size: .init(width: Constants.profileFrameSize.width, height: Constants.profileFrameSize.height))
            .roundCorner(radius: .point(20))
            .placeholder { _ in
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: Constants.profileFrameSize.width)
            }
            .fixedSize(horizontal: true, vertical: true)
            .aspectRatio(contentMode: .fit)
    }
}
