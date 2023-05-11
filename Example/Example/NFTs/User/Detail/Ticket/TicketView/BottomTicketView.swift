import SwiftUI

struct BottomTicketView: View {
    let qrCodeImage: CGImage

    var body: some View {
         Image(qrCodeImage, scale: 1, label: Text(""))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .padding(30)
            .modifier(FullWidthModifier())
    }
}
