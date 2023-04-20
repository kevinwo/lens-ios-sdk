import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        VStack {
            if viewModel.state == .walletIsReady || viewModel.state == .isAuthenticating {
                Text("Welcome to Lens")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                    .padding()
            }

            Spacer()

            VStack {
                switch viewModel.state {
                case .unknown:
                    Spacer()
                    ProgressView()
                    Spacer()
                case .isAuthenticating:
                    ProgressView()
                case .profileSelected:
                    Text("Profile details TBD")
                case .isSignedIn:
                    Text("Select profile TBD")
                case .walletIsReady:
                    Button("Sign In") {
                        Task {
                            await viewModel.didTapSignInButton()
                        }
                    }
                case .noWallet:
                    Button("Get Started") {
                        Task {
                            await viewModel.didTapGetStartedButton()
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewModel: AccountViewModel())
    }
}
