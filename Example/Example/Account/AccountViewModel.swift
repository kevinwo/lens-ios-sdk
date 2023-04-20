import Foundation

final class AccountViewModel: ObservableObject {
    enum AccountState {
        case unknown
        case isAuthenticating
        case profileSelected
        case isSignedIn
        case walletIsReady
        case noWallet
    }

    // MARK: - Properties

    @Published var state: AccountState = .unknown
    @Published var authError: String?

    private let wallet = Wallet()

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        do {
            let isSignedIn = try await Current.authentication.verify()

            if isSignedIn {
                state = .isSignedIn
                return
            }

            let walletIsReady = await wallet.isSignedIn()

            if walletIsReady {
                state = .walletIsReady
            } else {
                state = .noWallet
            }
        } catch {
            authError = String(describing: error)
        }
    }

    @MainActor
    func didTapGetStartedButton() async {
        authError = nil
        state = .isAuthenticating

        do {
            let _ = try await wallet.signIn()
            await didTapSignInButton()
        } catch {
            authError = String(describing: error)
            state = .noWallet
        }
    }

    @MainActor
    func didTapSignInButton() async {
        authError = nil
        state = .isAuthenticating

        do {
            let address = try await wallet.address()
            let message = try await Current.authentication.challenge(address: address)
            let signature = try await wallet.personalSign(message: message)
            try await Current.authentication.authenticate(
                address: address,
                signature: signature
            )
            state = .isSignedIn
        } catch {
            authError = String(describing: error)
            state = .walletIsReady
        }
    }
}
