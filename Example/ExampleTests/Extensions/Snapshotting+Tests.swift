import SnapshotTesting
import UIKit

/// Thanks to Point Free for this excellent SwiftUI view snapshot helper!
/// https://github.com/pointfreeco/episode-code-samples/blob/main/0086-swiftui-snapshot-testing/PrimeTime/CounterTests/CounterTests.swift#L8
extension Snapshotting where Value: UIViewController, Format == UIImage {
    static var windowedImage: Snapshotting {
        return Snapshotting<UIImage, UIImage>.image.asyncPullback { vc in
            Async<UIImage> { callback in
                UIView.setAnimationsEnabled(false)
                let window = UIApplication.shared.windows.first!
                window.rootViewController = vc
                DispatchQueue.main.async {
                    let image = UIGraphicsImageRenderer(bounds: window.bounds).image { ctx in
                        window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                    }
                    callback(image)
                    UIView.setAnimationsEnabled(true)
                }
            }
        }
    }
}
