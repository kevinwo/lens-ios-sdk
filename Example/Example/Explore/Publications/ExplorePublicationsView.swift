import SwiftUI

struct ExplorePublicationsView: View {
    @ObservedObject var viewModel = ExplorePublicationsViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                if viewModel.publications.isEmpty && !viewModel.isLoading {
                    Text("There are no publications to explore right now.")
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

struct ExplorePublicationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePublicationsView()
    }
}
