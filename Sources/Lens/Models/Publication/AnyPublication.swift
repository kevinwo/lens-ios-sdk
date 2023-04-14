import Foundation

protocol AnyPublication {
    associatedtype P: AnyProfile
    associatedtype M: AnyMetadata

    var id: String { get }
    var profile: P { get }
    var metadata: M { get }
    var createdAt: String { get }
}
