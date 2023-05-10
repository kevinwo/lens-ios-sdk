import SwiftUI

struct UserNftDetailInfoView: View {
    let title: String
    let description: String

    var body: some View {
        ScrollView {
            VStack {
                Text(title)
                    .font(.title)

                Text(description)
            }
        }
        .padding()
    }
}

struct UserNftDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserNftDetailInfoView(
            title: "Cool collectible",
            description: "Cool description"
        )
    }
}
