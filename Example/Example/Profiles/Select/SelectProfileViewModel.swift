import Foundation
import Lens

final class SelectProfileViewModel: ObservableObject {
    enum State {
        case isLoading
        case profiles([any Profile])
        case noProfile
    }
    @Published var state: State = .isLoading

    @MainActor
    func onAppear() async {
        do {
            let address = try await Current.wallet.address()
            let request = ProfileQueryRequest(ownedBy: [address])
            let result = try await Current.profiles.fetchAll(request: request)

            if !result.profiles.isEmpty {
                state = .profiles(result.profiles)
            } else {
                state = .noProfile
            }
        } catch {
            // TODO: Handle error
            state = .noProfile
        }
    }
}
