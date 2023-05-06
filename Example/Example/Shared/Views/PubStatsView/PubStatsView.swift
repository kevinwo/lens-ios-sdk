import Lens
import SwiftUI

struct PubStatsView: View {
    @StateObject var viewModel: PubStatsViewModel

    var body: some View {
        HStack(spacing: 26) {
            PubStatView(iconName: "message", value: viewModel.totalAmountOfComments)
            PubStatView(iconName: "arrow.2.squarepath", value: viewModel.totalAmountOfMirrors)

            Button {
                Task { await viewModel.didTapUpvoteButton() }
            } label: {
                PubStatView(iconName: viewModel.upvoteIconName, value: viewModel.totalUpvotes)
            }
            .buttonStyle(.plain)

            PubStatView(iconName: "square.stack", value: viewModel.totalAmountOfCollects)
        }
        .foregroundColor(.secondary)
        .padding(.top, 5)
    }

    static func view(publication: Publication) -> some View {
        let viewModel = PubStatsViewModel(publication: publication)

        return PubStatsView(viewModel: viewModel)
    }
}

struct PubStatView: View {
    let iconName: String
    let value: Int

    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text("\(value)")
        }
    }
}
