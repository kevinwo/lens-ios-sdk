import Foundation
import Lens

final class ExplorePublicationsViewModel: ObservableObject {
    // MARK: - Properties

    @Published var isLoading: Bool = true
    @Published var publications = [Publication]()
    @Published var sortCriteria: PublicationSortCriteria = .topCommented
    @Published var pageInfo: PageInfo?

    @MainActor
    func onAppear() async {
        if publications.isEmpty {
            await fetchPublications()
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
        guard let pageInfo else {
            return
        }

        isLoading = true

        let request = ExplorePublicationRequest(
            cursor: .init(stringLiteral: pageInfo.next),
            sortCriteria: .init(sortCriteria)
        )

        do {
            let results = try await Current.explore.publications(request: request)
            self.publications.append(contentsOf: results.items)
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoading = false
    }

    @MainActor
    private func fetchPublications() async {
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
