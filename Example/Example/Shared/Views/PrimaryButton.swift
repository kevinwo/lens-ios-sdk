import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    let isProgressing: Binding<Bool>?

    init(_ title: String, isProgressing: Binding<Bool>? = nil, action: @escaping () -> Void) {
        self.title = title
        self.isProgressing = isProgressing
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            if let isProgressing, isProgressing.wrappedValue {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))

            } else {
                HStack {
                    Spacer()
                    Text(title)
                    Spacer()
                }
            }
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(.blue)
        .cornerRadius(10)
    }
}
