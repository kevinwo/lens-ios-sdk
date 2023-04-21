import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    let isProgressing: Binding<Bool>

    init(_ title: String, isProgressing: Binding<Bool>, action: @escaping () -> Void) {
        self.title = title
        self.isProgressing = isProgressing
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            if isProgressing.wrappedValue {
                ProgressView()
            } else {
                Text(title)
            }
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
    }
}
