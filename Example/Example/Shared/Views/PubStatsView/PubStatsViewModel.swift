import Foundation
import Lens

final class PubStatsViewModel: ObservableObject {
    // MARK: - Properties

    @Published var isUpvoted: Bool = false

    var totalAmountOfComments: Int {
        publication.stats.totalAmountOfComments
    }

    var totalAmountOfMirrors: Int {
        publication.stats.totalAmountOfMirrors
    }

    var upvoteIconName: String {
        isUpvoted ? "heart.fill" : "heart"
    }

    var totalUpvotes: Int {
        publication.stats.totalUpvotes
    }

    var totalAmountOfCollects: Int {
        publication.stats.totalAmountOfCollects
    }

    let publication: Publication

    // MARK: - Object life cycle

    init(publication: Publication) {
        self.publication = publication
        self.isUpvoted = publication.reaction != nil
    }

    // MARK: - Internal interface

    @MainActor
    func didTapUpvoteButton() async {
        guard let profileId = Current.user.profileId else {
            return
        }

        /// We optimistically toggle the upvote state
        isUpvoted = !isUpvoted

        Task {
            do {
                let request = ReactionRequest(
                    profileId: profileId,
                    reaction: .init(.upvote),
                    publicationId: publication.publicationId
                )

                if isUpvoted {
                    try await Current.reactions.add(request: request)
                } else {
                    try await Current.reactions.remove(request: request)
                }
            } catch {
                /// If upvote fails to save, we revert the upvote state
                isUpvoted = !isUpvoted
            }
        }
    }
}
