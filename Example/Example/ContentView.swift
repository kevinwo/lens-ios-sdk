import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    static func scene() -> some View {
        ContentView(viewModel: ContentViewModel())
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .checkingIfAuthenticated:
                ProgressView()
            case .authenticated:
                TabView {
                    NavigationView {
                        FeedView()
                            .navigationBarItems(trailing: leftNavigationItem)
                    }
                    .tabItem {
                        Label("Feed", systemImage: "house")
                    }

                    NavigationView {
                        ExplorePublicationsView()
                            .navigationBarItems(trailing: leftNavigationItem)
                    }
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                }
            case .unauthenticated:
                NavigationView {
                    VStack {
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
                            .navigationBarItems(trailing: leftNavigationItem)

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
