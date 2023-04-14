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
            }
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Comment.forPreview
        let viewModel = CommentRowModel(comment: comment)
        CommentRow(viewModel: viewModel)
    }
}
