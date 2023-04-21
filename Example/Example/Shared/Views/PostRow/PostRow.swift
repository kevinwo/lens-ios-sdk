import Kingfisher
import Lens
import SwiftUI

struct PostRow: View {
    // MARK: - Properties

    let viewModel: PostRowModel

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
