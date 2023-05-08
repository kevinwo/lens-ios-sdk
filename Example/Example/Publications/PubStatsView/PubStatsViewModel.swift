import Foundation
import Lens

final class PubStatsViewModel: ObservableObject {
    // MARK: - Properties

    @Published var isUpvoted: Bool = false
    @Published var totalUpvotes: Int
    @Published var totalAmountOfComments: Int
    @Published var totalAmountOfMirrors: Int

    @Published var isCollected: Bool = false
    @Published var totalAmountOfCollects: Int

    @Published var confirmCollectModalIsPresented: Bool = false

    @Published var alreadyCollectedAlertIsPresented: Bool = false

    var upvoteIconName: String {
        isUpvoted ? "heart.fill" : "heart"
    }

    var collectIconName: String {
        isUpvoted ? "square.stack.fill" : "square.stack"
    }

    let publication: Publication

    // MARK: - Object life cycle

    init(publication: Publication) {
        self.publication = publication

        isUpvoted = publication.reaction != nil
        totalUpvotes = publication.stats.totalUpvotes

        totalAmountOfComments = publication.stats.totalAmountOfComments
        totalAmountOfMirrors = publication.stats.totalAmountOfMirrors

        isCollected = publication.hasCollectedByMe
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

    func didTapCollectButton() {
        guard !isCollected else {
            alreadyCollectedAlertIsPresented = true
            return
        }

        confirmCollectModalIsPresented = true
    }

    func didCollect(txHash: String) {
        isCollected = true
        totalAmountOfCollects += 1
        confirmCollectModalIsPresented = false
        // TODO: Maybe display a toast with the option to check the transaction status
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
