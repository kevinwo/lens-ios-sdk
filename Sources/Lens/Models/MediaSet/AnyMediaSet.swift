import Foundation

protocol AnyMediaSet {
    associatedtype T: AnyMedia

    var original: T { get }
}

protocol AnyMedia {
    var url: String { get }
    var mimeType: String? { get }
}
