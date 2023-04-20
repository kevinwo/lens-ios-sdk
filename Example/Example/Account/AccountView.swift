import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        VStack {
            Text("Welcome to Lens")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
                .padding()

            Spacer()

            VStack {
                if viewModel.isSigningIn {
                    ProgressView()
                } else if viewModel.walletIsReady {
                    Button("Sign In") {
                        Task {
                            await viewModel.didTapSignInButton() {
                                dismiss()
                            }
                        }
                    }
                } else {
                    Button("Get Started") {
                        Task {
                            await viewModel.didTapGetStartedButton() {
                                dismiss()
                            }
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
