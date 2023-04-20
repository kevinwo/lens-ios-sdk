import Foundation

final class ContentViewModel: ObservableObject {
    enum Sheet: String, Identifiable {
        case account

        var id: String { rawValue }
    }

    @Published var isSignedIn = false
    @Published var checkingIfAuthenticated = true
    @Published var presentedSheet: Sheet?

    @MainActor
    func onAppear() async {
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
        // TODO
    }
}
