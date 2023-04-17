import Foundation
import Lens

final class ExplorePublicationsViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var publications = [Publication]()
    @Published var sortCriteria: PublicationSortCriteria = .topCommented

    @MainActor
    func fetchPublications() async {
        isLoading = true

        let request = ExplorePublicationRequest(
            sortCriteria: .init(sortCriteria)
        )

        do {
            let results = try await Current.explore.publications(request: request)
            self.publications = results.items
        } catch {
            // TODO: Handle error
        }

        isLoading = false
    }
}
