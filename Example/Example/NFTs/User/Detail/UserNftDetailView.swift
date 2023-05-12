import Lens
import SwiftUI

struct UserNftDetailView: View {
    @StateObject var viewModel: UserNftDetailViewModel

    var body: some View {
        VStack {
            switch viewModel.viewType {
            case .info:
                UserNftDetailInfoView(
                    title: viewModel.title,
                    description: viewModel.description
                )
            case .ticket:
                UserNftDetailTicketView.view(
                    title: viewModel.title,
                    subtitle: viewModel.nft.collectionName,
                    imageUri: viewModel.nft.originalContent.uri,
                    contractAddress: viewModel.nft.contractAddress,
                    tokenId: viewModel.nft.tokenId
                )
            case .coupon:
                UserNftDetailCouponView.view(
                    title: viewModel.title,
                    subtitle: viewModel.nft.collectionName,
                    imageUri: viewModel.nft.originalContent.uri,
                    contractAddress: viewModel.nft.contractAddress,
                    tokenId: viewModel.nft.tokenId
                )
            case .key:
                UserNftDetailKeyView.view()
            }
        }
        .navigationTitle("NFT")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("Picker", selection: $viewModel.viewType) {
                    ForEach(UserNftDetailViewModel.ViewType.allCases) { viewType in
                        Text(viewType.title)
                            .tag(viewType)
                    }
                }
                .pickerStyle(.menu)
            }
        }
    }

    static func view(nft: NFT) -> some View {
        let viewModel = UserNftDetailViewModel(nft: nft)

        return UserNftDetailView(viewModel: viewModel)
    }
}
