import SwiftUI

struct PubStatView: View {
    let action: () -> Void
    let iconName: String
    let value: Int
    let isActive: Binding<Bool>?
    let activeTintColor: Color

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                Text("\(value)")
            }
        }
        .tag(iconName)
        .buttonStyle(.plain)
        .foregroundColor(isActive?.wrappedValue ?? false ? activeTintColor : .secondary)
    }

    init(action: @escaping () -> Void, iconName: String, value: Int, isActive: Binding<Bool>? = nil, activeTintColor: Color = .secondary) {
        self.action = action
        self.iconName = iconName
        self.value = value
        self.isActive = isActive
        self.activeTintColor = activeTintColor
    }
}
