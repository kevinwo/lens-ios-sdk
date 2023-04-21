import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    init(_ title: String, action: () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(title, action: action)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
