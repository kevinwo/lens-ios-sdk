import SwiftUI

struct UserNftDetailTicketView: View {
    @StateObject var viewModel: UserNftDetailRepresentationViewModel

    var body: some View {
        VStack {
            if let qrCodeImage = viewModel.qrCodeImage {
                TicketView(
                    title: viewModel.title,
                    subtitle: viewModel.subtitle,
                    imageUri: viewModel.imageUri,
                    qrCodeImage: qrCodeImage
                )
            }

            Spacer()
        }
        .padding()
    }

    static func view(title: String, subtitle: String, imageUri: String, contractAddress: String, tokenId: String) -> some View {
        let viewModel = UserNftDetailRepresentationViewModel(
            title: title,
            subtitle: subtitle,
            imageUri: imageUri,
            contractAddress: contractAddress,
            tokenId: tokenId
        )

        return UserNftDetailTicketView(viewModel: viewModel)
    }
}

struct UserNftDetailTicketView_Previews: PreviewProvider {
    static var previews: some View {
        UserNftDetailTicketView.view(
            title: "Cool NFT",
            subtitle: "Creator",
            imageUri: "",
            contractAddress: "0x0",
            tokenId: "1"
        )
    }
}
