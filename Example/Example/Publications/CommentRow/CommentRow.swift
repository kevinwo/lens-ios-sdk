import Kingfisher
import Lens
import SwiftUI

struct CommentRow: View {
    // MARK: - Properties

    let viewModel: CommentRowModel

    @State private var selectedDestination: PublicationRowDestination? = nil

    var body: some View {
        VStack {
            if let mainPostViewModel = viewModel.mainPostViewModel {
                VStack(alignment: .leading) {
                    PublicationRowContentView.view(
                        publication: mainPostViewModel.publication,
                        selectedDestination: $selectedDestination,
                        isMainPostForComment: true
                    )
                    comment
                }
                .padding([.top, .bottom], 8)
            } else {
                comment
            }
        }
        .plainRowMultiNavigationLink(
            destinations: PublicationRowDestination.allCases,
            selection: $selectedDestination,
            destinationView: destinationView
        )
    }

    private var comment: some View {
        PublicationRowContentView.view(
            publication: viewModel.publication,
            selectedDestination: $selectedDestination
        )
    }

    @ViewBuilder
    private var destinationView: some View {
        switch selectedDestination {
        case .postProfile:
            ProfileView.scene(id: viewModel.mainPostViewModel!.authorId)
        case .commentProfile:
            ProfileView.scene(id: viewModel.authorId)
        case .comment:
            ThreadView.scene(publication: viewModel.publication)
        case .post:
            ThreadView.scene(publication: viewModel.mainPostViewModel!.publication)
        default:
            EmptyView()
        }
    }

    // MARK: - Internal interface

    static func view(comment: Comment) -> CommentRow {
        let viewModel = CommentRowModel(comment: comment)

        return CommentRow(viewModel: viewModel)
    }
}

#if DEBUG
struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Comment.forPreview
        let viewModel = CommentRowModel(comment: comment)
        return CommentRow(viewModel: viewModel)
    }
}
#endif
