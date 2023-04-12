import SwiftUI

struct ExplorePublicationsView: View {
    @ObservedObject var viewModel = ExplorePublicationsViewModel()

    var body: some View {
        List {
            ForEach(viewModel.publications, id: \.hashValue) { publication in
                switch publication.__typename {
                case "Post":
                    Text(publication.asPost?.metadata.content ?? "No post content")
                case "Comment":
                    Text(publication.asComment?.metadata.content ?? "No comment")
                default:
                    Group {}
                }
            }
        }
        .navigationTitle("Explore Publications")
        .onAppear {
            viewModel.fetchPublications()
        }
    }
}

struct ExplorePublicationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePublicationsView()
    }
}
