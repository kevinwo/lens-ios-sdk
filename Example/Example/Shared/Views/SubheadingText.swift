import SwiftUI

struct SubheadingText: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.headline)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct SubheadingText_Previews: PreviewProvider {
    static var previews: some View {
        SubheadingText("Cool Subheading")
    }
}
