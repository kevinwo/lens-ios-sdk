import Foundation
import Lens

final class ProfileViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case isLoading
        case profile(any Profile)
        case noProfile
    }

    // MARK: - Properties

    @Published var state: State = .isLoading

    private let id: String

    // MARK: - Object life cycle

    init(id: String) {
        self.id = id
    }

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        do {
            let request = SingleProfileQueryRequest(profileId: .init(stringLiteral: id))
            let result = try await Current.profiles.fetch(request: request)

            if let profile = result.profile {
                state = .profile(profile)
            } else {
                state = .noProfile
            }
        } catch {
            // TODO: Handle error
        }
    }
}
