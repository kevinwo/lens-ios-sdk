import Foundation
import MagicSDK

final class ContentViewModel: ObservableObject {
    @Published var walletIsReady = false
    @Published var checkingIfAuthenticated = true

    func onAppear() {
        _ = Magic.shared.user.isLoggedIn().done { [weak self] isLoggedIn in
            guard let self else { return }
            self.checkingIfAuthenticated = false
            self.walletIsReady = isLoggedIn
        }
    }

    func didTapWalletConnectButton() {
        checkingIfAuthenticated = true
        Magic.shared.wallet.connectWithUI { [weak self] resp in
            guard let self else { return }
            self.checkingIfAuthenticated = false
            if resp.status.isSuccess {
                self.walletIsReady = true
            }
        }
    }

    func didTapWalletDisconnectButton() {
        Magic.shared.wallet.disconnect { [weak self] resp in
            guard let self else { return }
            if resp.status.isSuccess {
                self.walletIsReady = false
            }
        }
    }
}
