import SwiftUI

#if !os(macOS)
struct ContentView: View {
    @StateObject var viewModel: ContentViewModel

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
                        FeedView.view()
                            .navigationBarItems(leading: leadingNavigationItem)
                    }
                    .tabItem {
                        Label("Feed", systemImage: "house")
                    }

                    NavigationView {
                        ExplorePublicationsView.view()
                            .navigationBarItems(leading: leadingNavigationItem)
                    }
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }

                    NavigationView {
                        UserNftsView.view()
                            .navigationBarItems(leading: leadingNavigationItem)
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

                        ExplorePublicationsView.view()
                            .navigationBarItems(leading: leadingNavigationItem)

                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .onFirstAppear {
            Task { await viewModel.onFirstAppear() }
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

    private var leadingNavigationItem: some View {
        VStack {
            switch viewModel.state {
            case .authenticated:
                Button {
                    Task { await viewModel.didTapAccountButton() }
                } label: {
                    MediaView(media: viewModel.media, preset: .feedProfilePicture)
                        .onFirstAppear {
                            Task { await viewModel.fetchProfile() }
                        }
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
