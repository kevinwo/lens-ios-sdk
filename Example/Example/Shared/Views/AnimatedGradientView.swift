import FluidGradient
import SwiftUI

struct AnimatedGradientView: View {
    @State var colors: [Color] = [.yellow, .green, .orange, .purple, .teal, .pink]
    @State var highlights: [Color] = [.yellow, .blue, .indigo, .purple, .blue, .teal]
    @State var speed = 1.0

    let colorPool: [Color] = [.blue, .green, .yellow, .orange, .red, .pink, .purple, .teal, .indigo]

    var body: some View {
        FluidGradient(
            blobs: colors,
            highlights: highlights,
            speed: speed
        )
    }

    private func setRandomColors() {
        colors = []
        highlights = []
        for _ in 0...Int.random(in: 5...5) {
            colors.append(colorPool.randomElement()!)
        }
        print(colors)
        for _ in 0...Int.random(in: 5...5) {
            highlights.append(colorPool.randomElement()!)
        }
    }
}
