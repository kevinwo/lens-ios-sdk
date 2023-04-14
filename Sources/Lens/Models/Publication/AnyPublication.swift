import Foundation

protocol AnyPublication {
    associatedtype P: Profile
    associatedtype M: Metadata

    var id: String { get }
    var profile: P { get }
    var metadata: M { get }
    var createdAt: String { get }
}
