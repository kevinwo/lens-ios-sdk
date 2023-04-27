import Foundation
import Lens

final class FeedViewModel: ObservableObject {
    // MARK: - Properties

    @Published var isLoading: Bool = true
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

        isLoading = true

        let request = FeedRequest(
            cursor: .init(stringLiteral: pageInfo.next),
            profileId: profileId
        )

        do {
            let results = try await Current.feed.fetch(request: request)
            self.publications.append(contentsOf: results.items)
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoading = false
    }

    @MainActor
    private func fetchFeed() async {
        guard let profileId = Current.user.profileId else {
            // TODO: Either show modal to choose profile or display an error
            return
        }

        isLoading = true

        let request = FeedRequest(profileId: profileId)

        do {
            let results = try await Current.feed.fetch(request: request)
            self.publications = results.items
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoading = false
    }
}
