import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        VStack {
            if viewModel.checkingIfAuthenticated {
                ProgressView()
            } else {
                Text("Welcome to Lens")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                    .padding()

                Spacer()

                if viewModel.walletIsReady {
                    Button("Sign In") {
                        Task { await viewModel.didTapGetStartedButton() }
                    }
                } else {
                    Button("Get Started") {
                        Task { await viewModel.didTapGetStartedButton() }
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
