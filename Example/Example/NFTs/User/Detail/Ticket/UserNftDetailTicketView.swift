import SwiftUI

struct UserNftDetailTicketView: View {
    @StateObject var viewModel: UserNftDetailRepresentationViewModel

    var body: some View {
        VStack {
            if let qrCodeImage = viewModel.qrCodeImage {
                TicketView(
                    title: viewModel.title,
                    subtitle: viewModel.subtitle,
                    mediaUri: viewModel.mediaUri,
                    mediaType: viewModel.mediaType,
                    qrCodeImage: qrCodeImage
                )
            }

            Spacer()
        }
        .padding()
    }

    static func view(title: String, subtitle: String, mediaUri: String, mediaType: String, contractAddress: String, tokenId: String) -> some View {
        let viewModel = UserNftDetailRepresentationViewModel(
            title: title,
            subtitle: subtitle,
            mediaUri: mediaUri,
            mediaType: mediaType,
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
            mediaUri: "",
            mediaType: "",
            contractAddress: "0x0",
            tokenId: "1"
        )
    }
}
