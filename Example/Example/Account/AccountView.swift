import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .walletIsReady, .isAuthenticating, .noWallet:
                    Text("Welcome to Lens")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)
                        .padding()

                    Spacer()
                default:
                    Group {}
                }

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
                        SelectProfileView()
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
