import SwiftUI

struct ProfileDetailView: View {
    @StateObject var viewModel: ProfileDetailViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading, .isSigningOut:
                ProgressView()
            case .noProfile:
                Text("No profile loaded. Please sign out and sign in again to select a profile.")

                Spacer()

                #if DEBUG
                Toggle("Demo mode", isOn: $viewModel.isDemoModeEnabled)
                #endif

                SecondaryButton("Sign Out") {
                    Task { await viewModel.didTapSignOutButton() }
                }
            case .profileLoaded:
                HeadingText(viewModel.name)
                SubheadingText(viewModel.handle)
                    .foregroundColor(.secondary)

                List {
                    Section {
                        HStack(spacing: 8) {
                            Text(viewModel.followers)
                            Text(viewModel.following)
                        }
                    }

                    Section {
                        Button {
                            viewModel.didTapSwitchProfileButton()
                        } label: {
                            Text("Switch profile")
                        }


                        #if DEBUG
                        Toggle("Demo mode", isOn: $viewModel.isDemoModeEnabled)
                        #endif

                        Button("Sign Out") {
                            Task { await viewModel.didTapSignOutButton() }
                        }
                    }
                }
            }
        }
        .onFirstAppear {
            Task { await viewModel.onFirstAppear() }
        }
    }

    static func view(accountState: Binding<AccountViewModel.AccountState>? = nil) -> ProfileDetailView {
        let viewModel = ProfileDetailViewModel(accountState: accountState)

        return ProfileDetailView(viewModel: viewModel)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView.view()
    }
}
