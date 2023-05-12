import SwiftUI

struct TicketDetailsView: View {
    var detail1  = "SEAT"
    var detail2 = "34"
    var detail3 = "TIME"
    var detail4 = "18:15"

    var body: some View {
        VStack(spacing: 10){
            VStack {
                Text(detail1)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.gray)
                Text(detail2)
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(.black)
            }

            VStack {
                Text(detail3)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.gray)
                Text(detail4).font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black)
            }
        }.modifier(FullWidthModifier())
    }
}

struct TicketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketDetailsView()
    }
}
