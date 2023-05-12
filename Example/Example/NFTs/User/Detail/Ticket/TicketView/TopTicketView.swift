import SwiftUI

struct TopTicketView: View {
    let title: String
    let subtitle: String
    let mediaUri: String
    let mediaType: String

    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Text(subtitle)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                Text(title)
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            .padding(.horizontal)

            MediaView(
                media: .from(uri: mediaUri, type: mediaType),
                preset: .ticket
            )

            HStack{
                TicketDetailsView(detail1: "SCREEN", detail2: "18", detail3: "PRICE", detail4: "$5.68")
                TicketDetailsView(detail1: "ROW", detail2: "H", detail3: "DATE", detail4: "06/20/23")
                TicketDetailsView()
            }.padding(.vertical)
        }
    }
}
