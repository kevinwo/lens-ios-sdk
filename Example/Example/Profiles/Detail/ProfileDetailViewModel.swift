import Combine
import Foundation
import Lens
import SwiftUI

final class ProfileDetailViewModel: ObservableObject {
    enum State {
        case isLoading
        case noProfile
        case profileLoaded
        case isSigningOut
    }

    // MARK: - Properties

    @Published var state: State = .isLoading
    @Published var profile: (any Profile)?
    #if DEBUG
    @Published var isDemoModeEnabled: Bool = false
    #endif
    var accountState: Binding<AccountViewModel.AccountState>?

    var name: String {
        profile?.name ?? ""
    }

    var handle: String {
        profile?.handle ?? ""
    }

    var followers: String {
        "\(profile?.stats.totalFollowers ?? 0) Followers"
    }

    var following: String {
        "\(profile?.stats.totalFollowing ?? 0) Following"
    }

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Object life cycle

    init(accountState: Binding<AccountViewModel.AccountState>? = nil) {
        self.accountState = accountState
    }

    // MARK: - Internal interface

    @MainActor
    func onFirstAppear() async {
        guard let profileId = Current.user.profileId else {
            accountState?.wrappedValue = .walletIsReady
            state = .noProfile
            return
        }

        let request = SingleProfileQueryRequest(profileId: .init(stringLiteral: profileId))

        do {
            let result = try await Current.profiles.fetch(request: request)
            self.profile = result.profile
            state = .profileLoaded
        } catch {
            // TODO: Handle error
        }

        #if DEBUG
        isDemoModeEnabled = Current.user.isDemoModeEnabled

        $isDemoModeEnabled
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { isDemoModeEnabled in
                Current.user.isDemoModeEnabled = isDemoModeEnabled
            }
            .store(in: &cancellables)
        #endif
    }

    func didTapSwitchProfileButton() {
        accountState?.wrappedValue = .isSignedIn
    }

    @MainActor
    func didTapSignOutButton() async {
        state = .isSigningOut

        do {
            try Current.authentication.clear()
            Current.user.profileId = nil
        } catch {
            // TODO: Handle error
        }

        accountState?.wrappedValue = .walletIsReady
    }
}
