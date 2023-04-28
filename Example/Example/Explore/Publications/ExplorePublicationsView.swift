import SwiftUI

struct ExplorePublicationsView: View {
    @ObservedObject var viewModel = ExplorePublicationsViewModel()

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                Spacer()
                ProgressView()
                Spacer()
            case .noPublications:
                Text("There are no publications to explore right now.")
            case .hasPublications:
                List {
                    ForEach(viewModel.publications) { publication in
                        PublicationRow.forPublication(publication)
                            .background(
                                NavigationLink(
                                    "",
                                    destination: ThreadView.scene(publication: publication)
                                ).opacity(0)
                            )
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
}

struct ExplorePublicationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePublicationsView()
    }
}
