import SwiftUI
import Lens

struct ExplorePublicationsView: View {
    @StateObject var viewModel = ExplorePublicationsViewModel()

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
            case .noPublications:
                Text("There are no publications to explore right now.")
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
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                Picker("Sort Criteria", selection: $viewModel.sortCriteria) {
                    ForEach(PublicationSortCriteria.allCases, id: \.self) { sortCriteria in
                        Text(sortCriteria.name)
                    }
                }
                .pickerStyle(.menu)
        )
        .searchable(
            text: $viewModel.queryString,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onFirstAppear {
            viewModel.onFirstAppear()
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
