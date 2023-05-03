import Foundation
import Lens

final class PublicationsViewModel: ObservableObject {
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

    private let profileId: String

    // MARK: - Object life cycle

    init(profileId: String) {
        self.profileId = profileId
    }

    // MARK: - Internal interface

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

        let request = PublicationsQueryRequest(
            cursor: .init(stringLiteral: pageInfo.next),
            profileId: .init(stringLiteral: profileId)
        )

        do {
            let results = try await Current.publications.fetchAll(request: request)
            publications.append(contentsOf: results.publications)
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoadingMore = false
    }

    @MainActor
    private func fetchPublications() async {
        state = .isLoading

        let request = PublicationsQueryRequest(
            profileId: .init(stringLiteral: profileId),
            publicationTypes: .init(arrayLiteral: .case(.post))
        )

        do {
            let results = try await Current.publications.fetchAll(request: request)
            publications = results.publications
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
