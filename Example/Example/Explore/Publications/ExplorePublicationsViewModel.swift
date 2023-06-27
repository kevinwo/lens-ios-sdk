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

    private let interactor: ExplorePublicationsInteractorType

    // MARK: - Object life cycle

    init(interactor: ExplorePublicationsInteractorType) {
        self.interactor = interactor
    }

    // MARK: - Internal interface

    func onFirstAppear() {
        $sortCriteria
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    await self.loadPublications()
                }
            }
            .store(in: &cancellables)
    }

    func onAppear() async {
        if publications.isEmpty && state != .isLoading {
            await loadPublications()
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

        do {
            let results = try await interactor.fetchPublications(sortCriteria: sortCriteria, cursor: pageInfo.next)
            publications.append(contentsOf: results.items)
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoadingMore = false
    }

    @MainActor
    private func loadPublications() async {
        state = .isLoading

        do {
            let results = try await interactor.fetchPublications(sortCriteria: sortCriteria, cursor: nil)
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
