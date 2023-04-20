import SwiftUI
import Lens
import MagicSDK

@main
struct ExampleApp: App {
    init() {
        Wallet.configure()
        LensClient.configure(appName: "Example")
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
