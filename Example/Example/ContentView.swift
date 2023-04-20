import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.checkingIfAuthenticated {
                    ProgressView()
                } else if viewModel.isSignedIn {
                    FeedView()
                    Spacer()
                } else {
                    HStack {
                        Text("Welcome to Lizi 👋")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.primary)
                            .padding()
                        Spacer()
                    }
                    Text("Lizi is a decentralized, and permissionless social media mobile app built with Lens Protocol")
                        .foregroundColor(.secondary)

                    ExplorePublicationsView()

                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(
                trailing: leftNavigationItem
            )
            .onAppear {
                Task { await viewModel.onAppear() }
            }
            .sheet(
                item: $viewModel.presentedSheet,
                onDismiss: {
                    Task { await viewModel.verifyAuth() }
                },
                content: { sheet in
                    switch sheet {
                    case .account:
                        AccountView(viewModel: AccountViewModel())
                    }
                }
            )
        }
    }

    private var leftNavigationItem: some View {
        VStack {
            if viewModel.isSignedIn {
                Button("Sign Out") {
                    Task { await viewModel.didTapWalletDisconnectButton() }
                }
            } else if !viewModel.checkingIfAuthenticated {
                Button("Sign In") {
                    Task { await viewModel.didTapSignInButton() }
                }
            } else {
                Group {}
            }
        }
    }
}
