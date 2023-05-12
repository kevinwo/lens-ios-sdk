import SwiftUI

struct PubContentView: View {
    let content: String
    let mediaUri: String?
    let mediaType: String?

    var body: some View {
        Text(content)
            .font(.callout)

        if let mediaUri, let mediaType {
            MediaView(
                media: MediaView.Media.from(uri: mediaUri, type: mediaType),
                preset: .mediaImage,
                contentMode: .fit
            )
            .mediaRounded()
        }
    }
}

struct PubContentView_Previews: PreviewProvider {
    static var previews: some View {
        PubContentView(content: "Cool content", mediaUri: nil, mediaType: nil)
    }
}
