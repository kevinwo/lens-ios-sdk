import Foundation
import KeychainAccess

protocol KeychainType {
    func get(_ key: String) throws -> String?
    func set(_ value: String, key: String) throws
}

final class Keychain: KeychainType {
    enum Key {
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
    }

    private let keychain = KeychainAccess.Keychain(service: LensClient.appBundleIdentifier ?? "com.lens")

    func get(_ key: String) throws -> String? {
        try keychain.get(key)
    }

    func set(_ value: String, key: String) throws {
        try keychain.set(value, key: key)
    }
}
