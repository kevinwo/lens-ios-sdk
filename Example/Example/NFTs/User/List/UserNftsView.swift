import SwiftUI

struct UserNftsView: View {
    enum Constants {
        static let columnSpacing: CGFloat = 16
        static let lineSpacing: CGFloat = 32
    }

    @StateObject var viewModel: UserNftsViewModel

    let columns = [
        GridItem(.flexible(), spacing: Constants.columnSpacing),
        GridItem(.flexible(), spacing: Constants.columnSpacing)
    ]

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
            case .noNfts:
                Text("You haven't collected any content yet.")
            case .hasNfts:
                ScrollView {
                    LazyVGrid(columns: columns, spacing: Constants.lineSpacing) {
                        ForEach(viewModel.nfts) { nft in
                            NavigationLink(destination: UserNftDetailView.view(nft: nft)) {
                                UserNftsGridItemView.view(nft: nft)
                                    .onAppear {
                                        Task { await viewModel.onRowAppear(for: nft) }
                                    }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Collectibles")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }

    static func view() -> some View {
        let viewModel = UserNftsViewModel()

        return UserNftsView(viewModel: viewModel)
    }
}
