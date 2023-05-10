import Lens
import SwiftUI

struct UserNftDetailView: View {
    @StateObject var viewModel: UserNftDetailViewModel

    var body: some View {
        VStack {
            Picker("Picker", selection: $viewModel.viewType) {
                ForEach(UserNftDetailViewModel.ViewType.allCases) { viewType in
                    Text(viewType.title)
                        .tag(viewType)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            Spacer()

            switch viewModel.viewType {
            case .info:
                UserNftDetailInfoView(
                    title: viewModel.title,
                    description: viewModel.description
                )
            case .ticket:
                UserNftDetailTicketView()
            case .coupon:
                Text("Coupon view")
            case .key:
                Text("Key view")
            }
        }
        .navigationTitle("NFT")
    }

    static func view(nft: NFT) -> some View {
        let viewModel = UserNftDetailViewModel(nft: nft)

        return UserNftDetailView(viewModel: viewModel)
    }
}
