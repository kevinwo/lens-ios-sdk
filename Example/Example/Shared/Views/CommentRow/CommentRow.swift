import Kingfisher
import Lens
import SwiftUI

struct CommentRow: View {
    enum Destination: String, CaseIterable, Identifiable, Hashable {
        case profile
        case mainPost
        case comment

        var id: String {
            rawValue
        }
    }

    @State private var selectedDestination: Destination? = nil

    let viewModel: CommentRowModel

    static func view(comment: Comment) -> CommentRow {
        let viewModel = CommentRowModel(comment: comment)

        return CommentRow(viewModel: viewModel)
    }

    var body: some View {
        VStack {
            if let mainPostViewModel = viewModel.mainPostViewModel {
                VStack(alignment: .leading) {
                    PostRow(viewModel: mainPostViewModel)
                        .onTapGesture {
                            selectedDestination = .mainPost
                        }
                    comment
                }
                .padding([.top, .bottom], 8)
            } else {
                comment
            }
        }
        .plainRowMultiNavigationLink(
            destinations: Destination.allCases,
            selection: $selectedDestination,
            destinationView: destinationView
        )
    }

    private var comment: some View {
        HStack(alignment: .top) {
            KFImage(viewModel.authorProfileImageUrl)
                .profilePicture()
                .onTapGesture {
                    selectedDestination = .profile
                }

            VStack(alignment: .leading) {
                PubBylineView(
                    authorName: viewModel.authorName,
                    authorHandle: viewModel.authorHandle,
                    timeAgo: viewModel.timeAgo
                )

                PubContentView(
                    content: viewModel.content,
                    mediaImageUrl: viewModel.mediaImageUrl
                )

                PubStatsView(stats: viewModel.stats)
            }
        }
        .onTapGesture {
            selectedDestination = .comment
        }
    }

    @ViewBuilder
    private var destinationView: some View {
        switch selectedDestination {
        case .profile:
            ProfileView.scene(id: viewModel.authorId)
        case .comment:
            ThreadView.scene(publication: viewModel.publication)
        case .mainPost:
            ThreadView.scene(publication: viewModel.mainPostViewModel!.publication)
        default:
            EmptyView()
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Comment.forPreview
        let viewModel = CommentRowModel(comment: comment)
        return CommentRow(viewModel: viewModel)
    }
}
