import SwiftUI

struct ProfileDetailView: View {
    @StateObject var viewModel: ProfileDetailViewModel

    var body: some View {
        VStack {
            Spacer()

            switch viewModel.state {
            case .isLoading, .isSigningOut:
                ProgressView()
            case .noProfile:
                Text("No profile loaded. Please sign out and sign in again to select a profile.")
            case .profileLoaded:
                HeadingText(viewModel.name)
                SubheadingText(viewModel.handle)

                List {
                    HStack(spacing: 8) {
                        Text(viewModel.followers)
                        Text(viewModel.following)
                    }
                }
            }

            Spacer()

            Button("Sign Out") {
                Task { await viewModel.didTapSignOutButton() }
            }
            .buttonStyle(.bordered)
        }
        .onFirstAppear {
            Task { await viewModel.onFirstAppear() }
        }
    }

    static func view() -> ProfileDetailView {
        let viewModel = ProfileDetailViewModel()

        return ProfileDetailView(viewModel: viewModel)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView.view()
    }
}
