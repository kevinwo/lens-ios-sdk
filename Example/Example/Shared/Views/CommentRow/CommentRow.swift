import Kingfisher
import Lens
import SwiftUI

struct CommentRow: View {
    let viewModel: CommentRowModel
    let mainPostViewModel: PostRowModel?

    static func view(comment: Comment) -> CommentRow {
        let viewModel = CommentRowModel(publication: comment)
        // TODO: Support mirror as a main post
        let mainPostViewModel: PostRowModel? = {
            if let post = comment.mainPost as? Post {
                return PostRowModel(publication: post, isMainPostForComment: true)
            } else {
                return nil
            }
        }()
        return CommentRow(
            viewModel: viewModel,
            mainPostViewModel: mainPostViewModel
        )
    }

    var body: some View {
        if let mainPostViewModel {
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
        let viewModel = CommentRowModel(publication: comment)
        let mainPostViewModel = PostRowModel(publication: comment.mainPost as! Post)
        return CommentRow(
            viewModel: viewModel,
            mainPostViewModel: mainPostViewModel
        )
    }
}
