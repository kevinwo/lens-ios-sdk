import SwiftUI

struct ExplorePublicationsView: View {
    @ObservedObject var viewModel = ExplorePublicationsViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.publications.isEmpty {
                Text("There are no publications to explore right now.")
            } else {
                List {
                    ForEach(viewModel.publications) { publication in
                        ExplorePublicationsRow.forPublication(publication)
                    }
                }
                .listStyle(.plain)
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
