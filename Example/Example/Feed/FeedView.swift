import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.publications.isEmpty {
                Spacer()
                Text("There are no publications in your feed. Follow some new people to see publications!")
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(viewModel.publications) { publication in
                        PublicationRow.forPublication(publication)
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
