import Foundation

extension Stubs {
    enum Reaction {
        static func add200ResponseJSON() -> Data {
            """
            {
              "data": {}
            }
            """.data(using: .utf8)!
        }

        static func remove200ResponseJSON() -> Data {
            """
            {
              "data": {}
            }
            """.data(using: .utf8)!
        }
    }
}
