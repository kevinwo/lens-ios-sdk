import Foundation
import Lens

final class ExplorePublicationsViewModel: ObservableObject {
    @Published var publications = [Publication]()
    @Published var sortCriteria: PublicationSortCriteria = .topCommented

    func fetchPublications() {
        let explore = Explore()
        let request = ExplorePublicationRequest(
            sortCriteria: .init(sortCriteria)
        )

        Task {
            do {
                let results = try await explore.publications(request: request)

                DispatchQueue.main.async {
                    self.publications = results.items
                }
            } catch {
                // TODO: Handle error
            }
        }
    }
}
