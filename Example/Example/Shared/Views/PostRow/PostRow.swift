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

                PubContentView(content: viewModel.content)
            }
        }
    }

    // MARK: - Internal interface

    static func view(post: Post) -> PostRow {
        let viewModel = PostRowModel(post: post)
        return PostRow(viewModel: viewModel)
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        let dict: [String: AnyHashable] = [
            "id": "cool-id",
            "profile": [
                "id": "0x0f",
                "name": "Kevin Wo",
                "handle": "kevinwo.lens"
            ],
            "metadata": [
                "content": "Cool post content here right now"
            ],
            "createdAt": "2022-04-20T06:26:56.000Z",
            "collectModule": [
              "__typename": "RevertCollectModuleSettings",
              "type": "RevertCollectModule"
            ]
        ]
        let json = JSONValue(dict)
        let post = Post(_dataDict: .init(data: try! .init(_jsonValue: json)))
        let viewModel = PostRowModel(post: post)
        PostRow(viewModel: viewModel)
    }
}
