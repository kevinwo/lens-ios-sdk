import Foundation
import Lens

open class PublicationRowModel<P: Publication> {
    // MARK: - Properties

    let publication: P

    var authorId: String {
        publication.profile.id
    }

    // MARK: - Object life cycle

    init(publication: P) {
        self.publication = publication
    }
}
