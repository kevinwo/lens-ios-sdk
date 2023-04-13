import SwiftUI
import Lens

struct PostRow: View {
    let viewModel: PostRowModel

    static func view(post: Post) -> PostRow {
        let viewModel = PostRowModel(post: post)
        return PostRow(viewModel: viewModel)
    }

    var body: some View {
        HStack {
            Text("Image")

            VStack(alignment: .leading) {
                HStack {
                    if let name = viewModel.authorName { Text(name).bold() }

                    Text(viewModel.authorHandle)
                        .foregroundColor(.gray)

                    if let timeAgo = viewModel.timeAgo {
                        Text("·")
                        Text(timeAgo).foregroundColor(.gray)
                    }
                }
                .font(.callout)

                Text(viewModel.content)
                    .font(.callout)
            }
        }
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
