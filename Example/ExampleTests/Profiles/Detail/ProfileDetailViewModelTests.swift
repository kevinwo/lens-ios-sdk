import SwiftUI
import XCTest
@testable import Example
@testable import LensTestTools

final class ProfileDetailViewModelTests: XCTestCase {
    var viewModel: ProfileDetailViewModel!
    var mockAuthentication: MockAuthentication!
    @Binding var accountState: AccountViewModel.AccountState = .unknown

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        mockAuthentication = MockAuthentication()
        Current.authentication = mockAuthentication

        viewModel = ProfileDetailViewModel(accountState: $accountState)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockAuthentication = nil
        accountState = .unknown
    }

    // MARK: - Tests

    func test_didTapSignOutButton() async throws {
        // given
        Current.user.profileId = "0x01"
        accountState = .isSignedIn

        // when
        await viewModel.didTapSignOutButton()

        // then
        // it should clear authentication tokens
        XCTAssertTrue(mockAuthentication.invokedClear)

        // it should clear the profile id
        XCTAssertNil(Current.user.profileId)

        // it should set the state to ready with wallet
        XCTAssertEqual(accountState, .walletIsReady)
    }
}
