import Foundation
import Lens

final class FeedViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case isLoading
        case hasPublications
        case noPublications
    }

    // MARK: - Properties

    @Published var state: State = .isLoading
    @Published var isLoadingMore: Bool = false
    @Published var publications = [Publication]()
    @Published var pageInfo: PageInfo?

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        if publications.isEmpty {
            await fetchFeed()
        }
    }

    func onRowAppear(for publication: Publication) async {
        if publications.last == publication {
            await fetchNextPage()
        }
    }

    // MARK: - Private interface

    @MainActor
    private func fetchNextPage() async {
        guard let pageInfo, let profileId = Current.user.profileId else {
            return
        }

        isLoadingMore = true

        let request = FeedRequest(
            cursor: .init(stringLiteral: pageInfo.next),
            profileId: profileId
        )

        do {
            let results = try await Current.feed.fetch(request: request, observerId: Current.user.profileId)
            publications.append(contentsOf: results.items)
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoadingMore = false
    }

    @MainActor
    private func fetchFeed() async {
        guard let profileId = Current.user.profileId else {
            // TODO: Either show modal to choose profile or display an error
            return
        }
        state = .isLoading

        let request = FeedRequest(profileId: profileId)

        do {
            let results = try await Current.feed.fetch(request: request, observerId: Current.user.profileId)
            publications = results.items
            pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        if !publications.isEmpty {
            state = .hasPublications
        } else {
            state = .noPublications
        }
    }
}
