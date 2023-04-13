import SwiftUI
import Lens

struct PostRow: View {
    let viewModel: PostRowViewModel

    static func view(post: Post) -> PostRow {
        let viewModel = PostRowViewModel(post: post)
        return PostRow(viewModel: viewModel)
    }

    var body: some View {
        Text(viewModel.title)
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(_dataDict: .init(data: try! .init(_jsonValue: ["empty": "post"])))
        let viewModel = PostRowViewModel(post: post)
        PostRow(viewModel: viewModel)
    }
}
