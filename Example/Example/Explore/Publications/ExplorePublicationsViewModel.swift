import Foundation
import Lens

final class ExplorePublicationsViewModel: ObservableObject {
    @Published var publications = [Publication]()
    @Published var sortCriteria: PublicationSortCriteria = .topCommented

    @MainActor
    func fetchPublications() async {
        let request = ExplorePublicationRequest(
            sortCriteria: .init(sortCriteria)
        )

        do {
            let results = try await Current.explore.publications(request: request)
            self.publications = results.items
        } catch {
            // TODO: Handle error
        }
    }
}
