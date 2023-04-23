import Lens
import SwiftUI

struct PubStatsView: View {
    let stats: PublicationStats

    var body: some View {
        HStack(spacing: 26) {
            PubStatView(iconName: "message", value: stats.totalAmountOfComments)
            PubStatView(iconName: "arrow.2.squarepath", value: stats.totalAmountOfMirrors)
            PubStatView(iconName: "heart", value: stats.totalUpvotes)
            PubStatView(iconName: "square.stack", value: stats.totalAmountOfCollects)
        }
        .foregroundColor(.secondary)
        .padding(.top, 5)
    }
}

struct PubStatView: View {
    let iconName: String
    let value: Int

    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text("\(value)")
        }
    }
}
