import Foundation
import Lens
import XCTest

extension ProfilesResponse: Equatable {
    public static func == (lhs: ProfilesResponse, rhs: ProfilesResponse) -> Bool {
        lhs.profiles.map { $0.id } == rhs.profiles.map { $0.id }
    }
}

extension ProfileResponse: Equatable {
    public static func == (lhs: ProfileResponse, rhs: ProfileResponse) -> Bool {
        guard let lhsProfile = lhs.profile else {
            XCTFail("Left profile is nil when testing equality")
            return false
        }
        guard let rhsProfile = rhs.profile else {
            XCTFail("Right profile is nil when testing equality")
            return false
        }

        return lhsProfile.id == rhsProfile.id
    }
}
