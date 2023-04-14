import Foundation

// MARK: - API Type Conformance

public typealias ExplorePublication = ExplorePublicationsQuery.Data.ExplorePublications.Item
extension ExplorePublication: Lens.Publication {
    public var id: String {
        __data["id"]
    }

    public var authorProfile: Profile {
        __data["profile"]
    }
}

// MARK: - Types

public protocol Publication {
    var id: String { get }
    var authorProfile: Lens.Profile { get }
}
