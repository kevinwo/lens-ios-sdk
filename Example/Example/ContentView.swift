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

                Section(
                    header: Text("Authenticated"),
                    footer: FooterView(text: viewModel.authError)
                ) {
                    if viewModel.checkingIfAuthenticated || viewModel.isSigningIn {
                        ProgressView()
                    } else if viewModel.walletIsReady {
                        Button("Sign in to Lens") {
                            Task { await viewModel.didTapSignInButton() }
                        }

                        Button("Disconnect Wallet") {
                            Task { await viewModel.didTapWalletDisconnectButton() }
                        }
                    } else {
                        Button("Connect Wallet") {
                            Task { await viewModel.didTapWalletConnectButton() }
                        }
                    }
                }
            }
            .navigationTitle("Lens")
            .onAppear {
                Task { await viewModel.onAppear() }
            }
        }
    }
}
