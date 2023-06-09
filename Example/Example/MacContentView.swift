import SwiftUI

#if os(macOS)
struct MacContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    static func scene() -> some View {
        MacContentView(viewModel: ContentViewModel())
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .checkingIfAuthenticated:
                ProgressView()
            case .authenticated:
                TabView {
                    NavigationView {
                        FeedView.view()
                    }
                    .tabItem {
                        Label("Feed", systemImage: "house")
                    }

                    NavigationView {
                        ExplorePublicationsView()
                    }
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }

                    NavigationView {
                        UserNftsView.view()
                    }
                    .tabItem {
                        Label("Collectibles", systemImage: "square.stack")
                    }
                }
            case .unauthenticated:
                NavigationView {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Welcome to Lizi 👋")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.primary)
                                .padding(8)

                            Text("Lizi is a decentralized, and permissionless social media mobile app built with Lens Protocol")
                                .foregroundColor(.secondary)
                                .padding(8)
                        }

                        ExplorePublicationsView()

                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
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
#endif
