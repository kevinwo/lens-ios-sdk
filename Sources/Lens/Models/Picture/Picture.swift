import Foundation

public protocol Picture {
    associatedtype MS: MediaSet

    var asMediaSet: MS? { get }
}
