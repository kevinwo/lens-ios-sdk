import SwiftUI

extension View {
    public var typeErased: AnyView { AnyView(self) }

    func plainRowNavigationLink<Destination: View>(@ViewBuilder destination: () -> Destination) -> some View {
        self
            .background(
                NavigationLink(
                    "",
                    destination: destination
                ).opacity(0)
            )
    }
}
