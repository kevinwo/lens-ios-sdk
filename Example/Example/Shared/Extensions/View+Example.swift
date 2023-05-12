import Kingfisher
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

    func onFirstAppear(_ action: @escaping () -> ()) -> some View {
        modifier(FirstAppear(action: action))
    }

    func mediaRounded() -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: MediaView.Constants.mediaImageCornerRadius))
    }
}

private struct FirstAppear: ViewModifier {
    let action: () -> ()

    // Use this to only fire your block one time
    @State private var hasAppeared = false

    func body(content: Content) -> some View {
        // And then, track it here
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            action()
        }
    }
}
