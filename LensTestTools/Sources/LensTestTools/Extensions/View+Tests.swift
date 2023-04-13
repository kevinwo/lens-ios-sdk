import SwiftUI

extension View {
    public func prepareForSnapshotting() -> UIHostingController<Self> {
        let controller = UIHostingController(rootView: self)
        controller.view.layoutIfNeeded()
        controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)

        return controller
    }
}
