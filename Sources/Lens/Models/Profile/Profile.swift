import Foundation

public class Profile: Codable {
    public let id: String
    public let name: String?
    public let handle: String
    public let picture: MediaSet?

    init(profile: any AnyProfile) {
        self.id = profile.id
        self.name = profile.name
        self.handle = profile.handle
        self.picture = MediaSet(mediaSet: profile.picture?.mediaSet)
    }
}
