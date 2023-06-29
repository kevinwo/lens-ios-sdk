import XCTest
@testable import Example

final class TestObserver: NSObject {}

extension TestObserver: XCTestObservation {
    func testCaseWillStart(_ testCase: XCTestCase) {
        Current = World()
    }
}
