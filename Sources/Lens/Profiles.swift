import Foundation

public protocol ProfilesType {
    func fetchAll(request: ProfileQueryRequest) async throws -> ProfilesResponse
    func create(request: CreateProfileRequest) async throws -> String
}

public final class Profiles: ProfilesType {
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

    public func create(request: CreateProfileRequest) async throws -> String {
        let mutation = CreateProfileMutation(request: request)
        let data = try await client.request(mutation: mutation)

        guard let txHash = data.createProfile.asRelayerResult?.txHash else {
            throw Error.invalidTxHash
        }

        return txHash
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
