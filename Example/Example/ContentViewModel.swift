import Foundation

final class ContentViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case checkingIfAuthenticated
        case authenticated
        case unauthenticated
    }

    enum Sheet: String, Identifiable {
        case account, selectProfile

        var id: String { rawValue }
    }

    // MARK: - Properties

    @Published var state: State = .checkingIfAuthenticated
    @Published var presentedSheet: Sheet?

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        await verifyAuth()
    }

    @MainActor
    func verifyAuth() async {
        state = .checkingIfAuthenticated
        do {
            let isSignedIn = try await Current.authentication.verify()
            state = isSignedIn ? .authenticated : .unauthenticated
        } catch {
            // TODO: Handle error
            state = .unauthenticated
        }
    }

    @MainActor
    func didTapSignInButton() async {
        presentedSheet = .account
    }

    @MainActor
    func didTapWalletDisconnectButton() async {
        state = .checkingIfAuthenticated

        do {
            try Current.authentication.clear()
            try await Current.wallet.disconnect()
            try await Current.wallet.signOut()
        } catch {
            // TODO: Handle error
        }

        state = .unauthenticated
    }
}
