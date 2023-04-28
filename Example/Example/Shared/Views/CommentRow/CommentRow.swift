import Kingfisher
import Lens
import SwiftUI

struct CommentRow: View {
    let viewModel: CommentRowModel

    static func view(comment: Comment) -> CommentRow {
        let viewModel = CommentRowModel(comment: comment)

        return CommentRow(viewModel: viewModel)
    }

    var body: some View {
        if let mainPostViewModel = viewModel.mainPostViewModel {
            VStack(alignment: .leading) {
                PostRow(viewModel: mainPostViewModel)
                comment
            }
            .padding([.top, .bottom], 8)
        } else {
            comment
        }
    }

    private var comment: some View {
        HStack(alignment: .top) {
            KFImage(viewModel.authorProfileImageUrl)
                .profilePicture()

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
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Comment.forPreview
        let viewModel = CommentRowModel(comment: comment)
        return CommentRow(viewModel: viewModel)
    }
}
