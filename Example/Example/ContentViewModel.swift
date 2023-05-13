import Foundation
import Lens

final class ContentViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case checkingIfAuthenticated
        case authenticated
        case unauthenticated
    }

    enum Sheet: String, Identifiable {
        case account

        var id: String { rawValue }
    }

    // MARK: - Properties

    @Published var state: State = .checkingIfAuthenticated
    @Published var presentedSheet: Sheet?
    @Published var media: MediaView.Media?

    // MARK: - Internal interface

    @MainActor
    func onFirstAppear() async {
        await verifyAuth()
    }

    @MainActor
    func verifyAuth() async {
        state = .checkingIfAuthenticated
        do {
            let isSignedIn = try await Current.authentication.verify()
            state = isSignedIn ? .authenticated : .unauthenticated

            if isSignedIn, Current.user.profileId == nil {
                presentedSheet = .account
            }
        } catch {
            // TODO: Handle error
            state = .unauthenticated
        }
    }

    @MainActor
    func fetchProfile() async {
        guard let id = Current.user.profileId else {
             return
        }

        do {
            let request = SingleProfileQueryRequest(profileId: .init(stringLiteral: id))
            let result = try await Current.profiles.fetch(request: request)
            guard let mediaSet = result.profile?.picture?.asMediaSet?.original else {
                self.media = .from(
                    uri: "file:///\(Bundle.main.path(forResource: "profile-placeholder", ofType: "png")!)",
                    type: "image/png"
                )
                return
            }

            self.media = .from(
                uri: mediaSet.url,
                type: mediaSet.mimeType
            )
        } catch {
            // TODO: Handle error
        }
    }

    @MainActor
    func didTapSignInButton() async {
        presentedSheet = .account
    }

    func didTapAccountButton() async {
        presentedSheet = .account
    }
}
