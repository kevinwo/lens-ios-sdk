import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AccountViewModel

    var body: some View {
        NavigationView {
            ZStack {
                if case .profileSelected = viewModel.state {
                    // No background
                } else {
                    AnimatedGradientView()
                        .edgesIgnoringSafeArea(.bottom)
                }

                VStack {
                    AccountHeadingView(
                        state: $viewModel.state,
                        title: viewModel.title,
                        description: viewModel.description
                    )

                    VStack {
                        switch viewModel.state {
                        case .unknown:
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            Spacer()
                        case .profileSelected:
                            ProfileDetailView.view(accountState: $viewModel.state)
                        case .isSignedIn:
                            SelectProfileView.scene(onSelectProfile: {
                                dismiss()
                            })
                        case .walletIsReady:
                            PrimaryButton("Sign In", isProgressing: $viewModel.isAuthenticating) {
                                Task {
                                    await viewModel.didTapSignInButton()
                                }
                            }

                            SecondaryButton("Disconnect wallet") {
                                Task { await viewModel.didTapDisconnectWalletButton() }
                            }
                            .foregroundColor(.white)
                            .padding(.top)
                        case .noWallet:
                            PrimaryButton("Get Started", isProgressing: $viewModel.isAuthenticating) {
                                Task {
                                    await viewModel.didTapGetStartedButton()
                                }
                            }

                            SecondaryButton("I already have a wallet") {
                                // TODO: WalletConnect
                            }
                            .foregroundColor(.white)
                            .padding(.top)
                        }
                    }
                    .padding()
                }
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
