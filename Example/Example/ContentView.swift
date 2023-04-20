import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .checkingIfAuthenticated:
                    ProgressView()
                case .authenticated:
                    FeedView()
                    Spacer()
                case .unauthenticated:
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
                    case .selectProfile:
                        SelectProfileView()
                    }
                }
            )
        }
    }

    private var leftNavigationItem: some View {
        VStack {
            switch viewModel.state {
            case .authenticated:
                Button("Sign Out") {
                    Task { await viewModel.didTapWalletDisconnectButton() }
                }
            case .unauthenticated:
                Button("Sign In") {
                    Task { await viewModel.didTapSignInButton() }
                }
            case .checkingIfAuthenticated:
                Group {}
            }
        }
    }
}
