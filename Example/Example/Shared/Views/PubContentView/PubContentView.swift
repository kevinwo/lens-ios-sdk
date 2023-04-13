import SwiftUI

struct PubContentView: View {
    let content: String

    var body: some View {
        Text(content)
            .font(.callout)
    }
}

struct PubContentView_Previews: PreviewProvider {
    static var previews: some View {
        PubContentView(content: "Cool content")
    }
}
