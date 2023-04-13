import Foundation
import Lens

final class PostRowModel {
    // MARK: - Properties

    private static let isoDateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        return formatter
    }()
    private static let daysFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.day]
        formatter.maximumUnitCount = 1
        return formatter
    }()
    private static let hoursFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour]
        formatter.maximumUnitCount = 1
        return formatter
    }()
    private static let minutesFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.minute]
        formatter.maximumUnitCount = 1
        return formatter
    }()

    let post: Post

    var authorName: String? {
        post.profile.name
    }

    var authorHandle: String {
        "@\(post.profile.handle)"
            .replacingOccurrences(of: ".test", with: "")
            .replacingOccurrences(of: ".lens", with: "")
    }

    var timeAgo: String? {
        guard let date = PostRowModel.isoDateFormatter.date(from: post.createdAt) else { return nil }
        let now = Date()
        let difference = Calendar.current.dateComponents([.day, .hour, .minute], from: date, to: now)

        if difference.day ?? 0 > 0 {
            return PostRowModel.daysFormatter.string(from: difference)
        } else if difference.hour ?? 0 > 0 {
            return PostRowModel.hoursFormatter.string(from: difference)
        } else {
            return PostRowModel.minutesFormatter.string(from: difference)
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
