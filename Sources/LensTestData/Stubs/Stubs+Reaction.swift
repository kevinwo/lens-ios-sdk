import Foundation

extension Stubs {
    public enum Reaction {
        public static func add200ResponseJSON() -> Data {
            """
            {
              "data": {}
            }
            """.data(using: .utf8)!
        }

        public static func remove200ResponseJSON() -> Data {
            """
            {
              "data": {}
            }
            """.data(using: .utf8)!
        }
    }
}
