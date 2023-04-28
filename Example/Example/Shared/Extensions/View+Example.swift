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

    func plainRowMultiNavigationLink<Destination: Identifiable & Hashable>(
        destinations: [Destination],
        selection: Binding<Destination?>,
        destinationView: some View
    ) -> some View {
        self
            .background(
                VStack {
                    ForEach(destinations) { destination in
                        NavigationLink(
                            destination: destinationView,
                            tag: destination,
                            selection: selection
                        ) { EmptyView() }
                    }
                }.opacity(0)
            )
    }
}
