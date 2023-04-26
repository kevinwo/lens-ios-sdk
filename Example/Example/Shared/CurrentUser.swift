import Foundation

final class CurrentUser {
    let defaultsContainer = UserDefaults(suiteName: "group.com.swiftlee.app")!

    @UserDefault(key: "profileId")
    var profileId: String?
}

/// Thanks to SwiftLee for this excellent property wrapper!
/// https://www.avanderlee.com/swift/property-wrappers
@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value? = nil

    @available(*, unavailable)
    var wrappedValue: Value? {
        get { fatalError("This wrapper only works on instance properties of classes") }
        set { fatalError("This wrapper only works on instance properties of classes") }
    }

    static subscript(
        _enclosingInstance instance: CurrentUser,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<CurrentUser, Value?>,
        storage storageKeyPath: ReferenceWritableKeyPath<CurrentUser, Self>
    ) -> Value? {
        get {
            let propertyWrapper = instance[keyPath: storageKeyPath]
            let key = propertyWrapper.key
            return instance.defaultsContainer.object(forKey: key) as? Value
        }
        set {
            let propertyWrapper = instance[keyPath: storageKeyPath]
            let key = propertyWrapper.key
            instance.defaultsContainer.set(newValue, forKey: key)
        }
    }
}
