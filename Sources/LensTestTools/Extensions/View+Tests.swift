import SwiftUI

extension View {
    public func prepareForSnapshotting() -> UIHostingController<Self> {
        let controller = UIHostingController(rootView: self)
        controller.view.layoutIfNeeded()
        controller.view.drawHierarchy(in: UIScreen.main.bounds, afterScreenUpdates: true)

        return controller
    }
}
