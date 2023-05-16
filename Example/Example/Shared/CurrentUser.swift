import Foundation
import SwiftUI

final class CurrentUser {
    private static var defaultsContainer = UserDefaults(suiteName: "group.com.swiftlee.app")!

    @AppStorage("profileId", store: CurrentUser.defaultsContainer)
    var profileId: String?
    #if DEBUG
    @AppStorage("isDemoModeEnabled", store: CurrentUser.defaultsContainer)
    var isDemoModeEnabled: Bool = false
    #endif
}
