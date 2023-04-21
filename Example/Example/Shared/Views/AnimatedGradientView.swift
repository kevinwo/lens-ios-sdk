import FluidGradient
import SwiftUI

struct AnimatedGradientView: View {
    @State var colors: [Color] = []
    @State var highlights: [Color] = []
    @State var speed = 1.0

    let colorPool: [Color] = [.blue, .green, .yellow, .orange, .red, .pink, .purple, .teal, .indigo]

    var body: some View {
        FluidGradient(
            blobs: colors,
            highlights: highlights,
            speed: speed
        )
        .backgroundStyle(.quaternary)
        .onAppear {
            setColors()
        }
    }

    private func setColors() {
        colors = []
        highlights = []
        for _ in 0...Int.random(in: 5...5) {
            colors.append(colorPool.randomElement()!)
        }
        for _ in 0...Int.random(in: 5...5) {
            highlights.append(colorPool.randomElement()!)
        }
    }
}
