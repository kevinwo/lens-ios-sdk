import Kingfisher
import Lens
import SwiftUI

struct PostRow: View {
    // MARK: - Enums

    enum Constants {
        static let profileFrameSize = CGSize(width: 36, height: 36)
    }

    // MARK: - Properties

    let viewModel: PostRowModel

    var body: some View {
        HStack(alignment: .top) {
            KFImage(viewModel.authorProfileImageUrl)
                .resizable()
                .downsampling(size: .init(width: Constants.profileFrameSize.width, height: Constants.profileFrameSize.height))
                .roundCorner(radius: .point(20))
                .placeholder { _ in
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: Constants.profileFrameSize.width)
                }
                .fixedSize(horizontal: true, vertical: true)
                .aspectRatio(contentMode: .fit)

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
