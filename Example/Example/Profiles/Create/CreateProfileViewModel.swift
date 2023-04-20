import Foundation
import Lens

final class CreateProfileViewModel: ObservableObject {
    @Published var isCreating = false
    @Published var handle = ""

    @MainActor
    func didTapCreateButton() async {
        isCreating = true

        let request = CreateProfileRequest(handle: handle)

        do {
            let _ = try await Current.profiles.create(request: request)
        } catch {
            // TODO: Handle error
        }

        isCreating = false
    }
}
