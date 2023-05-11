import SwiftUI

struct TicketView: View {
    let title: String
    let subtitle: String
    let imageUri: String
    let qrCodeImage: CGImage

    var body: some View {
        VStack(spacing: 0) {
            TopTicketView(
                title: title,
                subtitle: subtitle,
                imageUri: imageUri
            )
            .background(.white)
            .clipShape(TicketShape())
            .modifier(CardStyleModifier())

            DashedSeperator()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 1,dash: [4,8], dashPhase: 4))
                .frame(height: 0.4)
                .padding(.horizontal)

            BottomTicketView(qrCodeImage: qrCodeImage)
                .background(.white)
                .clipShape(TicketShape().rotation(Angle(degrees: 180)))
                .modifier(CardStyleModifier())

        }
    }
}
