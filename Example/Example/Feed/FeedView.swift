import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                if viewModel.publications.isEmpty && !viewModel.isLoading {
                    Text("There are no publications in your feed. Follow some new people to see publications!")
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.publications) { publication in
                            PublicationRow.forPublication(publication)
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
            .frame(height: geometry.size.height - geometry.safeAreaInsets.bottom)
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
