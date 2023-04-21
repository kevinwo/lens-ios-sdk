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
                    case .walletIsReady, .isAuthenticating, .noWallet:
                        Spacer()

                        Image(systemName: "wallet.pass.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                        Text("Let's get you signed in")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        Text("Looks like you've got a wallet set up, so let's sign in to Lens.")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
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
                            PrimaryButton("Sign In") {
                                Task {
                                    await viewModel.didTapSignInButton()
                                }
                            }
                        case .noWallet:
                            PrimaryButton("Get Started") {
                                Task {
                                    await viewModel.didTapGetStartedButton()
                                }
                            }
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
