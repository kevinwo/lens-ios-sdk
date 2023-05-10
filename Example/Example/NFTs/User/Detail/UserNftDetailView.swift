import Lens
import SwiftUI

struct UserNftDetailView: View {
    @StateObject var viewModel: UserNftDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.title)
                .padding()
        }
        .navigationTitle("NFT")
    }

    static func view(nft: NFT) -> some View {
        let viewModel = UserNftDetailViewModel(nft: nft)

        return UserNftDetailView(viewModel: viewModel)
    }
}
