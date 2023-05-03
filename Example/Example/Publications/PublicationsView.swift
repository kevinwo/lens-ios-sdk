import SwiftUI

struct PublicationsView: View {
    // MARK: - Enums

    enum DisplayType {
        case list
        case lazyVStack
    }

    // MARK: - Properties

    @StateObject var viewModel: PublicationsViewModel
    let displayType: DisplayType

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
            case .noPublications:
                Text("There are no publications found.")
            case .hasPublications:
                publicationsList

                if viewModel.isLoadingMore {
                    ProgressView()
                }
            }
        }
        .onFirstAppear {
            Task { await viewModel.onAppear() }
        }
    }

    private var publicationsList: AnyView {
        /// A List unfortunately does not automatically expand its height when used inside a ScrollView.
        /// Therefore, we can optionally use a LazyVStack instead when necessary.
        switch displayType {
        case .list:
            return List {
                ForEach(viewModel.publications) { publication in
                    PublicationRow.forPublication(publication)
                        .onAppear {
                            Task { await viewModel.onRowAppear(for: publication) }
                        }
                }
            }
            .listStyle(.plain)
            .typeErased

        case .lazyVStack:
            return LazyVStack(alignment: .leading) {
                ForEach(viewModel.publications) { publication in
                    PublicationRow.forPublication(publication)
                        .onAppear {
                            Task { await viewModel.onRowAppear(for: publication) }
                        }
                    Divider()
                        .padding(.leading, 44)
                        .padding(.bottom, 4)
                }
            }
            .typeErased
        }
    }

    private var publications: some View {
        ForEach(viewModel.publications) { publication in
            PublicationRow.forPublication(publication)
                .onAppear {
                    Task { await viewModel.onRowAppear(for: publication) }
                }
        }
    }

    // MARK: - Internal interface

    static func view(profileId: String, displayType: DisplayType = .list) -> some View {
        let viewModel = PublicationsViewModel(profileId: profileId)

        return PublicationsView(viewModel: viewModel, displayType: displayType)
    }
}

struct PublicationsView_Previews: PreviewProvider {
    static var previews: some View {
        PublicationsView.view(profileId: "0x12345", displayType: .list)
    }
}
