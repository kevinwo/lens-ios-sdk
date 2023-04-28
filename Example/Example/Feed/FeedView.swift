import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()

    var body: some View {
        VStack {
            if viewModel.publications.isEmpty && !viewModel.isLoading {
                Text("There are no publications in your feed. Follow some new people to see publications!")
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                List {
                    ForEach(viewModel.publications) { publication in
                        PublicationRow.forPublication(publication)
                            .plainRowNavigationLink {
                                ThreadView.scene(publication: publication)
                            }
                            .onAppear {
                                Task { await viewModel.onRowAppear(for: publication) }
                            }
                    }
                }
                .listStyle(.plain)
            }

            if viewModel.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
