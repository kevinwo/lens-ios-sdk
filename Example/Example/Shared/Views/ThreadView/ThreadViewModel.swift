import Foundation
import Lens

final class ThreadViewModel: ObservableObject {
    private let publication: Publication

    init(publication: Publication) {
        self.publication = publication
    }
}
