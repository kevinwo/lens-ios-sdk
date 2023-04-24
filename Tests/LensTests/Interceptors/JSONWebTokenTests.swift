import SnapshotTesting
import XCTest
@testable import Lens

final class JSONWebTokenTests: XCTestCase {
    func test_isExpired_whenTokensIsNotExpired() throws {
        // given
        let tokenString = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjQ4MzgwMzc4MjcsImV4cCI6NDg2OTU3MzgyNywiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiY29vbEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.kqosgqVA6ATpR_6L6DjfNNHfBFTaX4t9heDtm5fs_f8"

        // when
        let jwt = try JSONWebToken(tokenString)

        // then
        XCTAssertFalse(jwt.isExpired)
    }

    func test_isExpired_whenTokensIsExpired() throws {
        // given
        let tokenString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjB4ZWVGYzIzRkU0OWJEZTFmNzk1YzY1MDUwMWFEQjFERWUxRThiNkQ5ZSIsInJvbGUiOiJub3JtYWwiLCJpYXQiOjE2ODIzNjU0MzcsImV4cCI6MTY4MjM2NzIzN30.VlfUALvGLjqazOyblFgY_bnhDmdPr5rE00BZhtKco9M"

        // when
        let jwt = try JSONWebToken(tokenString)

        // then
        XCTAssertTrue(jwt.isExpired)
    }

    func test_init_whenTokenIsValid() throws {
        // given
        let tokenString = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjQ4MzgwMzc4MjcsImV4cCI6NDg2OTU3MzgyNywiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiY29vbEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.kqosgqVA6ATpR_6L6DjfNNHfBFTaX4t9heDtm5fs_f8"

        // when
        let jwt = try JSONWebToken(tokenString)

        // then
        assertSnapshot(matching: jwt, as: .dump)
    }

    func test_init_whenTokenIsInvalid() throws {
        // given
        let tokenString = "whatthisisnotarealtoken"

        // when
        let subjectAction = {
            try JSONWebToken(tokenString)
        }

        // when/then
        XCTAssertThrowsError(try subjectAction())
    }
}
