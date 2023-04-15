import Kingfisher
import Lens
import SwiftUI

struct CommentRow: View {
    let viewModel: CommentRowModel

    static func view(comment: AnyComment) -> CommentRow {
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
        let comment = AnyComment(_dataDict: .init(data: try! .init(_jsonValue: json)))
        let viewModel = CommentRowModel(comment: comment)
        CommentRow(viewModel: viewModel)
    }
}
