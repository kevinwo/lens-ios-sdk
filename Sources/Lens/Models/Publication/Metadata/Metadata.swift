import Foundation

public protocol Metadata {
    associatedtype MS: MediaSet

    var name: String? { get }
    var description: String? { get }
    var content: String? { get }
    var media: [MS] { get }
}
