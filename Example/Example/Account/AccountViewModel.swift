import Foundation

final class AccountViewModel: ObservableObject {
    // MARK: - Properties

    @Published var checkingIfAuthenticated = true
    @Published var isSigningIn = false
    @Published var walletIsReady = false
    @Published var authError: String?

    private let wallet = Wallet()

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        walletIsReady = await wallet.isSignedIn()
        checkingIfAuthenticated = false
    }

    @MainActor
    func didTapGetStartedButton() async {
        authError = nil
        isSigningIn = true

        do {
            let _ = try await wallet.signIn()
        } catch {
            authError = String(describing: error)
        }

        isSigningIn = false
    }

    @MainActor
    func didTapSignInButton() async {
        isSigningIn = true

        do {
            let address = try await wallet.address()
            let message = try await Current.authentication.challenge(address: address)
            let signature = try await wallet.personalSign(message: message)
            try await Current.authentication.authenticate(
                address: address,
                signature: signature
                )
        } catch {
            authError = String(describing: error)
        }

        isSigningIn = false
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
