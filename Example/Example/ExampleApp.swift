import SwiftUI
import Lens

@main
struct ExampleApp: App {
    init() {
        #if !os(macOS)
        Wallet.configure()
        #endif
        LensClient.configure(appName: "Example")
    }

    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            MacContentView.scene()
            #else
            ContentView.scene()
            #endif
        }
    }
}
