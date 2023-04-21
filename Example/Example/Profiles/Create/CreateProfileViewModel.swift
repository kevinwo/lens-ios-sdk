import Foundation
import Lens

final class CreateProfileViewModel: ObservableObject {
    // MARK: - Properties

    let onCreateProfile: (String) -> Void
    @Published var isCreating = false
    @Published var handle = ""

    // MARK: - Object life cycle

    init(onCreateProfile: @escaping (String) -> Void) {
        self.onCreateProfile = onCreateProfile
    }

    // MARK: - Internal interface

    @MainActor
    func didTapCreateButton() async {
        isCreating = true

        let request = CreateProfileRequest(handle: handle)

        do {
            let _ = try await Current.profiles.create(request: request)
            onCreateProfile(handle)
        } catch {
            // TODO: Handle error
        }

        isCreating = false
    }
}
