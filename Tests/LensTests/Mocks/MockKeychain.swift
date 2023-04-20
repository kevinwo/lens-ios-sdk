import Foundation
@testable import Lens

final class MockKeychain: KeychainType {
    var data: [String: Any] = [:]

    func get(_ key: String) throws -> String? {
        data[key] as? String
    }

    func set(_ value: String, key: String) throws {
        data[key] = value
    }

    func remove(_ key: String) throws {
        data.removeValue(forKey: key)
    }

    func removeAll() throws {
        data.removeAll()
    }
}
