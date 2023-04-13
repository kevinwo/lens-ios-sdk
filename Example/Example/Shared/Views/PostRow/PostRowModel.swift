import Foundation
import Lens

final class PostRowModel {
    // MARK: - Properties

    let post: Post

    var authorProfileImageUrl: URL? {
        guard let urlString = post.profile.picture?.asMediaSet?.original.url else {
            return nil
        }
        return URL(string: urlString)
    }

    var authorName: String? {
        post.profile.name
    }

    var authorHandle: String {
        "@\(post.profile.handle)"
            .replacingOccurrences(of: ".test", with: "")
            .replacingOccurrences(of: ".lens", with: "")
    }

    var timeAgo: String? {
        guard let date = Formatter.isoDateFormatter.date(from: post.createdAt) else { return nil }
        let now = Date()
        let difference = Calendar.current.dateComponents([.day, .hour, .minute], from: date, to: now)

        if difference.day ?? 0 > 0 {
            return Formatter.daysFormatter.string(from: difference)
        } else if difference.hour ?? 0 > 0 {
            return Formatter.hoursFormatter.string(from: difference)
        } else {
            return Formatter.minutesFormatter.string(from: difference)
        }
    }

    var content: String {
        post.metadata.content ?? ""
    }

    // MARK: - Object life cycle

    init(post: Post) {
        self.post = post
    }
}
