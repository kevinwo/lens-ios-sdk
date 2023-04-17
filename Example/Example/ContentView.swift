import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Explore")) {
                    NavigationLink(destination: ExplorePublicationsView()) {
                        Text("Publications")
                    }
                }

                Section(header: Text("Authenticated")) {
                    if viewModel.checkingIfAuthenticated {
                        ProgressView()
                    } else if viewModel.walletIsReady {
                        Button("Disconnect") {
                            viewModel.didTapWalletDisconnectButton()
                        }
                    } else {
                        Button("Connect Wallet") {
                            viewModel.didTapWalletConnectButton()
                        }
                    }
                }
            }
            .navigationTitle("Lens")
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}
