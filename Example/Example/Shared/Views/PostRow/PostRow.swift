import Kingfisher
import Lens
import SwiftUI

struct PostRow: View {
    enum Destination: String, CaseIterable, Identifiable, Hashable {
        case profile
        case post

        var id: String {
            rawValue
        }
    }

    // MARK: - Properties

    @State private var selectedDestination: Destination? = nil

    let viewModel: PostRowModel

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                KFImage(viewModel.authorProfileImageUrl)
                    .feedProfilePicture()
                    .onTapGesture {
                        selectedDestination = .profile
                    }

                if viewModel.isMainPostForComment {
                    VerticalLine()
                }
            }

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
        .plainRowMultiNavigationLink(
            destinations: Destination.allCases,
            selection: $selectedDestination,
            destinationView: destinationView
        )
    }

    // MARK: - Internal interface

    static func view(post: Post) -> PostRow {
        let viewModel = PostRowModel(publication: post)
        return PostRow(viewModel: viewModel)
    }

    // MARK: - Private inteface

    @ViewBuilder
    private var destinationView: some View {
        switch selectedDestination {
        case .profile:
            ProfileView.scene(id: viewModel.authorId)
        case .post:
            ThreadView.scene(publication: viewModel.publication)
        default:
            EmptyView()
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post.forPreview
        let viewModel = PostRowModel(publication: post)
        PostRow(viewModel: viewModel)
    }
}
