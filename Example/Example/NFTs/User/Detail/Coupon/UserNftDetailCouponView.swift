import SwiftUI

// Thanks to Paul Hudson for his excellent marching ants border tutorial!
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-marching-ants-border-effect
struct UserNftDetailCouponView: View {
    @State private var phase = 0.0
    @StateObject var viewModel: UserNftDetailRepresentationViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(viewModel.subtitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing])
                Text(viewModel.title)
                    .font(.title)
                    .bold()
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .trailing])
                    .minimumScaleFactor(0.75)

                if let qrCodeImage = viewModel.qrCodeImage {
                    Image(qrCodeImage, scale: 1, label: Text(""))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            maxWidth: geometry.size.width,
                            maxHeight: geometry.size.width
                        )
                        .padding([.leading, .trailing])
                }

                Text("15% off storewide and wherever our products are sold.")
                    .foregroundColor(.gray)
                    .italic()
                    .multilineTextAlignment(.center)
            }
            .padding()
            .overlay(
                Rectangle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [5], dashPhase: phase))
                    .cornerRadius(10)
                    .onAppear {
                        withAnimation(.linear.repeatForever(autoreverses: false)) {
                            phase -= 10
                        }
                    }
            )
            .padding()
        }
    }

    static func view(title: String, subtitle: String, imageUri: String, contractAddress: String, tokenId: String) -> some View {
        let viewModel = UserNftDetailRepresentationViewModel(
            title: title,
            subtitle: subtitle,
            imageUri: imageUri,
            contractAddress: contractAddress,
            tokenId: tokenId
        )

        return UserNftDetailCouponView(viewModel: viewModel)
    }
}

struct UserNftDetailCouponView_Previews: PreviewProvider {
    static var previews: some View {
        UserNftDetailCouponView.view(
            title: "Cool NFT",
            subtitle: "Creator",
            imageUri: "",
            contractAddress: "0x0",
            tokenId: "1"
        )
    }
}
