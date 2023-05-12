// Based on https://github.com/airbnb/lottie-ios/issues/1891#issuecomment-1369240655

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let lottieFile: String
    let loopMode: LottieLoopMode = .playOnce
    var animationView = LottieAnimationView()

    @Binding var isAnimating: Bool

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()

        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(lottieFile)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        /// Lottie animation fails to play when animation view is a stored property on this struct, so we search for it for now and then run the animation.
        guard let animationView = uiView.subviews.first(where: { $0 is LottieAnimationView }) as? LottieAnimationView else {
            return
        }

        if isAnimating {
            animationView.play() { _ in
                isAnimating = false
            }
        } else {
            animationView.stop()
        }
    }
}
