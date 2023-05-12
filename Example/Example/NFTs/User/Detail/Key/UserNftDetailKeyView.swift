import Lottie
import SwiftUI

struct UserNftDetailKeyView: View {
    @State private var isUnlocking = false
    @State private var isUnlocked = false

    var body: some View {
        VStack {
            LottieView(
                lottieFile: "lock-unlock-key",
                isAnimating: $isUnlocked
            )

            PrimaryButton("Unlock", isProgressing: $isUnlocking) {
                isUnlocking = true

                // TODO: Integrate with a Bluetooth unlock protocol in the future and actually unlock a door w/ an NFT!

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isUnlocking = false
                    isUnlocked = true
                }
            }
            .padding()
        }
    }

    static func view() -> some View {
        return UserNftDetailKeyView()
    }
}
