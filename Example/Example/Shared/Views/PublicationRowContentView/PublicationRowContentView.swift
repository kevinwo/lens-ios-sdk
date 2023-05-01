import Kingfisher
import Lens
import SwiftUI

struct PublicationRowContentView: View {
    let viewModel: PublicationRowContentViewModel
    let selectedDestination: Binding<PublicationRowDestination?>

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                KFImage(viewModel.authorProfileImageUrl)
                    .feedProfilePicture()
                    .onTapGesture {
                        switch viewModel.publication {
                        case is Post:
                            selectedDestination.wrappedValue = .postProfile
                        case is Comment:
                            selectedDestination.wrappedValue = .commentProfile
                        default:
                            return
                        }
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
        .onTapGesture {
            switch viewModel.publication {
            case is Post:
                selectedDestination.wrappedValue = .post
            case is Comment:
                selectedDestination.wrappedValue = .comment
            default:
                return
            }
        }
    }

    static func view(
        publication: Publication,
        selectedDestination: Binding<PublicationRowDestination?>,
        isMainPostForComment: Bool = false
    ) -> some View {
        let viewModel = PublicationRowContentViewModel(publication: publication, isMainPostForComment: isMainPostForComment)
        return PublicationRowContentView(
            viewModel: viewModel,
            selectedDestination: selectedDestination
        )
    }
}
