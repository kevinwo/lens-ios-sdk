import Kingfisher
import SwiftUI

struct PubContentView: View {
    let content: String
    let mediaImageUrl: URL?

    var body: some View {
        Text(content)
            .font(.callout)

        if let mediaImageUrl {
            VStack {
                KFImage(mediaImageUrl)
                    .mediaImage()
            }
            .aspectRatio(contentMode: .fit)
            .mediaRounded()
        }
    }
}

struct PubContentView_Previews: PreviewProvider {
    static var previews: some View {
        PubContentView(content: "Cool content", mediaImageUrl: nil)
    }
}
