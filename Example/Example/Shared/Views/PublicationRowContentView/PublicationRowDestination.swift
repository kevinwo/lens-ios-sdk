import Foundation

enum PublicationRowDestination: String, CaseIterable, Identifiable, Hashable {
    case postProfile
    case commentProfile
    case post
    case comment

    var id: String {
        rawValue
    }
}
