import Foundation

final class ContentViewModel: ObservableObject {
    // MARK: - Enums

    enum Sheet: String, Identifiable {
        case account

        var id: String { rawValue }
    }

    // MARK: - Properties

    @Published var isSignedIn = false
    @Published var checkingIfAuthenticated = true
    @Published var presentedSheet: Sheet?

    private let wallet = Wallet()

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        await verifyAuth()
    }

    @MainActor
    func verifyAuth() async {
        checkingIfAuthenticated = true
        do {
            isSignedIn = try await Current.authentication.verify()
        } catch {
            // TODO: Handle error
        }
        checkingIfAuthenticated = false
    }

    @MainActor
    func didTapSignInButton() async {
        presentedSheet = .account
    }

    @MainActor
    func didTapWalletDisconnectButton() async {
        do {
            try Current.authentication.clear()
            try await wallet.disconnect()
            try await wallet.signOut()
            isSignedIn = false
        } catch {
            // TODO: Handle error
        }
    }
}
