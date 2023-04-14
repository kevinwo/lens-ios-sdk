import Foundation

public protocol MediaSet {
    associatedtype T: Media

    var original: T { get }
}
