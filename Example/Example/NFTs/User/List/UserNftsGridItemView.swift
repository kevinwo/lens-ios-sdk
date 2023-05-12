import Lens
import SwiftUI

struct UserNftsGridItemView: View {
    @StateObject var viewModel: UserNftsGridItemViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            MediaView(media: viewModel.media, preset: .mediaImage, aspectRatio: 1, contentMode: .fit)
                .mediaRounded()

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
