import Foundation
import Lens

final class ExplorePublicationsViewModel: ObservableObject {
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

        isLoadingMore = true

        let request = ExplorePublicationRequest(
            cursor: .init(stringLiteral: pageInfo.next),
            sortCriteria: .init(sortCriteria)
        )

        do {
            let results = try await Current.explore.publications(request: request, observerId: nil)
            publications.append(contentsOf: results.items)
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoadingMore = false
    }

    @MainActor
    private func fetchPublications() async {
        state = .isLoading

        let request = ExplorePublicationRequest(
            sortCriteria: .init(sortCriteria)
        )

        do {
            let results = try await Current.explore.publications(request: request, observerId: nil)
            publications = results.items
            self.pageInfo = results.pageInfo
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
