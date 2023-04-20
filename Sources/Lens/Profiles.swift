import Foundation

public final class Profiles {
    // MARK: - Enums

    public enum Error: Swift.Error {
        case invalidTxHash
    }

    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    public func fetchAll(request: ProfileQueryRequest) async throws -> ProfilesResponse {
        let query = ProfilesQuery(request: request)
        let data = try await client.request(query: query)

        return ProfilesResponse(response: data.profiles)
    }
}

public struct ProfilesResponse {
    public let profiles: [any Profile]
    // TODO: Handle pageInfo/other properties
    init(response: ProfilesQuery.Data.Profiles) {
        self.profiles = response.items
    }
}

extension ProfilesResponse: Equatable {
    public static func == (lhs: ProfilesResponse, rhs: ProfilesResponse) -> Bool {
        lhs.profiles.map { $0.id } == rhs.profiles.map { $0.id }
    }
}
