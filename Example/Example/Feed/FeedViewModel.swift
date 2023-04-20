import Foundation
import Lens

final class FeedViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var publications = [Publication]()

    @MainActor
    func onAppear() async {
        if publications.isEmpty {
            await fetchFeed()
        }
    }

    // MARK: - Private interface

    @MainActor
    private func fetchFeed() async {
        isLoading = true

        // TODO: Replace profile ID value after implementing profile fetch
        let request = FeedRequest(profileId: "0x1b")

        do {
            let results = try await Current.feed.fetch(request: request)
            self.publications = results.items
        } catch {
            // TODO: Handle error
        }

        isLoading = false
    }
}
