import SwiftUI

struct AccountHeadingView: View {
    @Binding var state: AccountViewModel.AccountState
    let title: String
    let description: String

    var body: some View {
        Group {
            switch state {
            case .walletIsReady, .noWallet:
                Spacer()

                Image(systemName: "wallet.pass.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                HeadingText(title)
                    .foregroundColor(.white)
                    .padding()
                SubheadingText(description)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            default:
                Group {}
            }
        }
    }
}
