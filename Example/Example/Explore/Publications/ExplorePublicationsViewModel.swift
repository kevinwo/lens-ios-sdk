import Combine
import Foundation
import Lens

extension PublicationSortCriteria {
    var name: String {
        switch self {
        case .topCommented: return "Top Commented"
        case .topCollected: return "Top Collected"
        case .topMirrored: return "Top Mirrored"
        case .curatedProfiles: return "Curated Profiles"
        case .latest: return "Latest"
        }
    }
}

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
    @Published var queryString: String = ""
    @Published var sortCriteria: PublicationSortCriteria = .latest
    @Published var pageInfo: PageInfo?

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Internal interface

    func onFirstAppear() {
        $sortCriteria
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    await self.fetchPublications()
                }
            }
            .store(in: &cancellables)
    }

    func onAppear() async {
        if publications.isEmpty && state != .isLoading {
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
            let results = try await Current.explore.publications(request: request, observerId: Current.user.profileId)
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

        do {
            #if DEBUG
            if Current.user.isDemoModeEnabled {
                publications = try Publication.demoExplorePublications()
                self.pageInfo = nil
            } else {
                try await loadPublications()
            }
            #else
            try await loadPublications()
            #endif
        } catch {
            // TODO: Handle error
        }

        if !publications.isEmpty {
            state = .hasPublications
        } else {
            state = .noPublications
        }
    }

    private func loadPublications() async throws {
        let request = ExplorePublicationRequest(sortCriteria: .init(sortCriteria))
        let results = try await Current.explore.publications(request: request, observerId: Current.user.profileId)

        publications = results.items
        self.pageInfo = results.pageInfo
    }
}
