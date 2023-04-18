import SwiftUI

struct FooterView: View {
    let text: String?

    var body: some View {
        VStack {
            if let text {
                Text(text)
            } else {
                Group {}
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(text: "Cool text")
    }
}
