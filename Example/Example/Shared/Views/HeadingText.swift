import SwiftUI

struct HeadingText: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct HeadingText_Previews: PreviewProvider {
    static var previews: some View {
        HeadingText("Cool Heading")
    }
}