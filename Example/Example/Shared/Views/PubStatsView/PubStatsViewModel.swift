import Foundation
import Lens

final class PubStatsViewModel: ObservableObject {
    // MARK: - Properties

    @Published var isUpvoted: Bool = false
    @Published var totalUpvotes: Int
    @Published var totalAmountOfComments: Int
    @Published var totalAmountOfMirrors: Int
    @Published var totalAmountOfCollects: Int

    var upvoteIconName: String {
        isUpvoted ? "heart.fill" : "heart"
    }

    let publication: Publication

    // MARK: - Object life cycle

    init(publication: Publication) {
        self.publication = publication

        isUpvoted = publication.reaction != nil
        totalUpvotes = publication.stats.totalUpvotes

        totalAmountOfComments = publication.stats.totalAmountOfComments
        totalAmountOfMirrors = publication.stats.totalAmountOfMirrors
        totalAmountOfCollects = publication.stats.totalAmountOfCollects
    }

    // MARK: - Internal interface

    @MainActor
    func didTapUpvoteButton() async {
        guard let profileId = Current.user.profileId else {
            return
        }

        /// We optimistically toggle the upvote state
        toggleUpvoted()

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
                toggleUpvoted()
            }
        }
    }

    // MARK: - Private interface

    private func toggleUpvoted() {
        isUpvoted = !isUpvoted

        if isUpvoted {
            totalUpvotes += 1
        } else {
            totalUpvotes -= 1
        }
    }
}
