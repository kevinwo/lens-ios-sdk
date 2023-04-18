import Foundation

final class ContentViewModel: ObservableObject {
    @Published var walletIsReady = false
    @Published var checkingIfAuthenticated = true
    @Published var isSigningIn = false
    @Published var authError: String?

    private let wallet = Wallet()

    @MainActor
    func onAppear() async {
        let isSignedIn = await wallet.isSignedIn()
        checkingIfAuthenticated = false
        walletIsReady = isSignedIn
    }

    @MainActor
    func didTapSignInButton() async {
        authError = nil
        isSigningIn = true

        do {
            let address = try await wallet.address()
            let message = try await Current.authentication.challenge(address: address)
            let signature = try await wallet.personalSign(message: message)
            // TODO: Sign in with Lens
        } catch {
            authError = String(describing: error)
        }

        isSigningIn = false
    }

    @MainActor
    func didTapWalletConnectButton() async {
        do {
            checkingIfAuthenticated = true
            let _ = try await wallet.signIn()
            checkingIfAuthenticated = false
            walletIsReady = true
        } catch {
            // TODO: Handle error
        }
    }

    @MainActor
    func didTapWalletDisconnectButton() async {
        do {
            try await wallet.signOut()
            walletIsReady = false
        } catch {
            // TODO: Handle error
        }
    }
}
