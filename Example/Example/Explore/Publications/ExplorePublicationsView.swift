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
                    ForEach(viewModel.publications, id: \.hashValue) { publication in
                        ExplorePublicationsRow.forPublication(publication)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Explore Publications")
        .onAppear {
            Task {
                await viewModel.fetchPublications()
            }
        }
    }
}

struct ExplorePublicationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePublicationsView()
    }
}
