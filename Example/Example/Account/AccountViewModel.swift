import Foundation

final class AccountViewModel: ObservableObject {
    enum AccountState {
        case unknown
        case profileSelected
        case isSignedIn
        case walletIsReady
        case noWallet
    }

    // MARK: - Properties

    @Published var state: AccountState = .unknown
    @Published var isAuthenticating: Bool = false
    @Published var authError: String?

    var title: String {
        switch state {
        case .walletIsReady:
            return "Let's get you signed in"
        case .noWallet:
            return "Let's get you a wallet"
        default:
            return ""
        }
    }

    var description: String {
        switch state {
        case .walletIsReady:
            return "Looks like you've got a wallet set up, so let's sign in to Lens."
        case .noWallet:
            return "A wallet lets you connect to the Lens network so you can follow others, and post and collect content."
        default:
            return ""
        }
    }

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        do {
            let isSignedIn = try await Current.authentication.verify()

            if isSignedIn {
                state = .isSignedIn
                return
            }

            let walletIsReady = await Current.wallet.isSignedIn()

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
        isAuthenticating = true

        do {
            let _ = try await Current.wallet.signIn()
            await didTapSignInButton()
        } catch {
            authError = String(describing: error)
            state = .noWallet
        }

        isAuthenticating = false
    }

    @MainActor
    func didTapSignInButton() async {
        authError = nil
        isAuthenticating = true

        do {
            let address = try await Current.wallet.address()
            let message = try await Current.authentication.challenge(address: address)
            let signature = try await Current.wallet.personalSign(message: message)
            try await Current.authentication.authenticate(
                address: address,
                signature: signature
            )
            state = .isSignedIn
        } catch {
            authError = String(describing: error)
            state = .walletIsReady
        }

        isAuthenticating = false
    }
}
