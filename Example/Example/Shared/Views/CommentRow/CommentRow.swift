import SwiftUI
import Lens

struct CommentRow: View {
    let viewModel: CommentRowModel

    static func view(comment: Comment) -> CommentRow {
        let viewModel = CommentRowModel(comment: comment)
        return CommentRow(viewModel: viewModel)
    }

    var body: some View {
        Text(viewModel.title)
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Comment(_dataDict: .init(data: try! .init(_jsonValue: ["empty": "comment"])))
        let viewModel = CommentRowModel(comment: comment)
        CommentRow(viewModel: viewModel)
    }
}
