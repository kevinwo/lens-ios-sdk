import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
            case .noPublications:
                Text("✅")
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                HeadingText("You're all set!")
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing, .bottom])
                Text("Get started by exploring content and following new people to have posts show up right here in your feed.")
                    .multilineTextAlignment(.center)
                    .padding()
                SecondaryButton("Explore") {
                    // TODO
                }
            case .hasPublications:
                List {
                    ForEach(viewModel.publications) { publication in
                        PublicationRow.forPublication(publication)
                            .onAppear {
                                Task { await viewModel.onRowAppear(for: publication) }
                            }
                    }
                }
                .listStyle(.plain)

                if viewModel.isLoadingMore {
                    ProgressView()
                }
            }
        }
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }

    // MARK: - Internal interface

    static func view() -> some View {
        let viewModel = FeedViewModel()

        return FeedView(viewModel: viewModel)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView.view()
    }
}
