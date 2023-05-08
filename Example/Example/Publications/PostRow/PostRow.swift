import Lens
import SwiftUI

struct PostRow: View {
    // MARK: - Properties

    let viewModel: PostRowModel

    @State private var selectedDestination: PublicationRowDestination? = nil

    var body: some View {
        PublicationRowContentView.view(
            publication: viewModel.publication,
            selectedDestination: $selectedDestination
        )
        .plainRowMultiNavigationLink(
            destinations: PublicationRowDestination.allCases,
            selection: $selectedDestination,
            destinationView: destinationView
        )
    }

    @ViewBuilder
    private var destinationView: some View {
        switch selectedDestination {
        case .postProfile:
            ProfileView.scene(id: viewModel.authorId)
        case .post:
            ThreadView.scene(publication: viewModel.publication)
        default:
            EmptyView()
        }
    }

    // MARK: - Internal interface

    static func view(post: Post) -> PostRow {
        let viewModel = PostRowModel(publication: post)

        return PostRow(viewModel: viewModel)
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post.forPreview
        let viewModel = PostRowModel(publication: post)
        PostRow(viewModel: viewModel)
    }
}
