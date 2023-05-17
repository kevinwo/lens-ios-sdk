import Foundation
import Lens

final class SelectProfileViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case isLoading
        case isCreating
        case profiles([any Profile])
        case noProfile
    }

    // MARK: - Properties

    let onSelectProfile: () -> Void
    @Published var state: State = .isLoading
    @Published var isCreatingProfile = false

    // MARK: - Object life cycle

    init(onSelectProfile: @escaping () -> Void) {
        self.onSelectProfile = onSelectProfile
    }

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        do {
            let address = try await Current.wallet.address()
            let request = ProfileQueryRequest(ownedBy: [address])
            let result = try await Current.profiles.fetchAll(request: request)

            if !result.profiles.isEmpty {
                state = .profiles(result.profiles)
            } else {
                state = .noProfile
            }
        } catch {
            // TODO: Handle error
            state = .noProfile
        }
    }

    func didSelectProfile(with id: String) {
        Current.user.profileId = id
        onSelectProfile()
    }

    func didTapCreateProfileButton() {
        state = .noProfile
    }

    @MainActor
    func didCreateProfile(with handle: String) async {
        state = .isCreating

        do {
            var profile: (any Profile)? = nil
            let address = try await Current.wallet.address()
            let request = ProfileQueryRequest(ownedBy: [address])

            /// For some reason, we're unable to just immediately fetch the single, profile from the server right after create. Therefore, we instead poll the profile list until it appears (usually in a few moments).
            while profile == nil {
                let result = try await Current.profiles.fetchAll(request: request)
                profile = result.profiles.filter { $0.handle.asPrettyHandle == handle.asPrettyHandle }.first

                if let profile {
                    Current.user.profileId = profile.id
                    onSelectProfile()
                } else {
                    try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
                }
            }
        } catch {
            // TODO: Handle error
            state = .noProfile
        }
    }
}
