import Lens
import SwiftUI

struct PubStatsView: View {
    @StateObject var viewModel: PubStatsViewModel

    var body: some View {
        HStack(spacing: 26) {
            PubStatView(
                action: {
                    // TODO
                },
                iconName: "message",
                value: viewModel.totalAmountOfComments
            )

            PubStatView(
                action: {
                    // TODO
                },
                iconName: "arrow.2.squarepath",
                value: viewModel.totalAmountOfMirrors
            )

            PubStatView(
                action: {
                    Task { await viewModel.didTapUpvoteButton() }
                },
                iconName: viewModel.upvoteIconName,
                value: viewModel.totalUpvotes,
                isActive: $viewModel.isUpvoted,
                activeTintColor: .red
            )

            PubStatView(
                action: {
                    viewModel.didTapCollectButton()
                },
                iconName: viewModel.collectIconName,
                value: viewModel.totalAmountOfCollects,
                isActive: $viewModel.isCollected,
                activeTintColor: .blue
            )
            .sheet(isPresented: $viewModel.confirmCollectModalIsPresented) {
                ConfirmCollectView.view(
                    publication: viewModel.publication,
                    onCollectComplete: { txHash in
                        viewModel.didCollect(txHash: txHash)
                    }
                )
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.hidden)
            }
            .alert(
                "You've already collected this!",
                isPresented: $viewModel.alreadyCollectedAlertIsPresented,
                actions: { Button("OK"){} }
            )
        }
        .padding(.top, 5)
    }

    static func view(publication: Publication) -> some View {
        let viewModel = PubStatsViewModel(publication: publication)

        return PubStatsView(viewModel: viewModel)
    }
}
