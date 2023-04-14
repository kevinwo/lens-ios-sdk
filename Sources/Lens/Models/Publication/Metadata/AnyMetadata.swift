import Foundation

protocol AnyMetadata {
    associatedtype MS: AnyMediaSet

    var name: String? { get }
    var description: String? { get }
    var content: String? { get }
    var media: [MS] { get }
}
