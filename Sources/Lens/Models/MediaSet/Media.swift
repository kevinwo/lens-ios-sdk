import Foundation

public protocol Media {
    var url: String { get }
    var mimeType: String? { get }
}
