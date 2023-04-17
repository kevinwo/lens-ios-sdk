import Foundation

final class ContentViewModel: ObservableObject {
    @Published var walletIsReady = false
    @Published var checkingIfAuthenticated = true

    private let wallet = Wallet()

    @MainActor
    func onAppear() async {
        let isSignedIn = await wallet.isSignedIn()
        checkingIfAuthenticated = false
        walletIsReady = isSignedIn
    }

    @MainActor
    func didTapWalletConnectButton() async {
        do {
            checkingIfAuthenticated = true
            let walletAddress = try await wallet.signIn()
            checkingIfAuthenticated = false
            // TODO: Persist wallet address
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
