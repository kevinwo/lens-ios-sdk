import SwiftUI
import Lens
import MagicSDK

@main
struct ExampleApp: App {
    init() {
        let customNode = CustomNodeConfiguration(rpcUrl: "https://polygon-rpc.com/", chainId: 80001)
        Magic.shared = Magic(apiKey: "your_magic_auth_api_key", customNode: customNode)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
