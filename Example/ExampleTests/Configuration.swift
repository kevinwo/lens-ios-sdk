import XCTest

final class Configuration: NSObject {
    override init() {
        XCTestObservationCenter.shared.addTestObserver(TestObserver())
    }
}
