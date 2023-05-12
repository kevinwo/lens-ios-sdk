import Foundation
import Lens

final class ProfileViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case isLoading
        case profile
        case noProfile
    }

    // MARK: - Properties

    @Published var state: State = .isLoading
    @Published private var profile: (any Profile)?

    var coverPictureMedia: MediaView.Media? {
        guard let mediaSet = profile?.coverPicture?.asMediaSet?.original else {
            return nil
        }
        return .from(uri: mediaSet.url, type: mediaSet.mimeType)
    }

    var pictureMedia: MediaView.Media? {
        guard let mediaSet = profile?.picture?.asMediaSet?.original else {
            return nil
        }
        return .from(uri: mediaSet.url, type: mediaSet.mimeType)
    }

    var name: String? {
        profile?.name
    }

    var handle: String {
        profile?.handle ?? ""
    }

    var bio: String? {
        profile?.bio
    }

    let id: String

    // MARK: - Object life cycle

    init(id: String) {
        self.id = id
    }

    // MARK: - Internal interface

    @MainActor
    func onAppear() async {
        do {
            let request = SingleProfileQueryRequest(profileId: .init(stringLiteral: id))
            let result = try await Current.profiles.fetch(request: request)

            if let profile = result.profile {
                self.profile = profile
                state = .profile
            } else {
                state = .noProfile
            }
        } catch {
            // TODO: Handle error
        }
    }
}
