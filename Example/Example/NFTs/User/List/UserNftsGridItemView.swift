import Lens
import Kingfisher
import SwiftUI

struct UserNftsGridItemView: View {
    @StateObject var viewModel: UserNftsGridItemViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack {
                KFImage(viewModel.mediaUrl)
                    .nftMediaImage()
            }
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: KFImage.Constants.mediaImageCornerRadius))

            Text(viewModel.title)
                .font(.body)
                .foregroundColor(.primary)
                .lineLimit(1)
                .bold()

            Text(viewModel.subtitle)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
    }

    static func view(nft: NFT) -> some View {
        let viewModel = UserNftsGridItemViewModel(nft: nft)

        return UserNftsGridItemView(viewModel: viewModel)
    }
}
