import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        NavigationView {
            ZStack {
                AnimatedGradientView()
                    .edgesIgnoringSafeArea(.bottom)

                VStack {
                    switch viewModel.state {
                    case .walletIsReady, .noWallet:
                        Spacer()

                        Image(systemName: "wallet.pass.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                        HeadingText(viewModel.title)
                            .foregroundColor(.white)
                        SubheadingText(viewModel.description)

                        Spacer()
                    default:
                        Group {}
                    }

                    VStack {
                        switch viewModel.state {
                        case .unknown:
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            Spacer()
                        case .profileSelected:
                            Text("Profile details TBD")
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
                        case .noWallet:
                            PrimaryButton("Get Started", isProgressing: $viewModel.isAuthenticating) {
                                Task {
                                    await viewModel.didTapGetStartedButton()
                                }
                            }

                            Button("I already have a wallet") {
                                // TODO: WalletConnect
                            }
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
