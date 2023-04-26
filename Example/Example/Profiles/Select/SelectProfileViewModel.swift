import Foundation
import Lens

final class SelectProfileViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case isLoading
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
        state = .isLoading

        do {
            let address = try await Current.wallet.address()
            let request = ProfileQueryRequest(ownedBy: [address])
            let result = try await Current.profiles.fetchAll(request: request)

            if let profile = result.profiles.filter({ $0.handle == handle }).first {
                Current.user.profileId = profile.id
                onSelectProfile()
            } else {
                state = .noProfile
            }
        } catch {
            // TODO: Handle error
            state = .noProfile
        }
    }
}
