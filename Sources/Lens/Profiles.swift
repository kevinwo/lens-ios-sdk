import Foundation

public protocol ProfilesType {
    func fetchAll(request: ProfileQueryRequest) async throws -> ProfilesResponse
    func create(request: CreateProfileRequest) async throws -> String
}

/**
 Fetch, create, and manage user profiles
 */
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

    /**
     Fetches multiple user profiles

     You create a request using criteria for fetching profiles. For example, if you wanted to fetch all the profiles belonging to a given user's wallet, you could do the following:

     ```swift
     let profiles = Profiles()
     let request = ProfileQueryRequest(ownedBy: ["0x0c0E611A29b339D8c1048F2Edf9d4160A5fb8F22"])
     let response = try await profiles.fetchAll(request: request)
     ```

     - Parameter request: The request parameters to use when fetching profiles
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing profiles and page info (todo: the latter)
     */
    public func fetchAll(request: ProfileQueryRequest) async throws -> ProfilesResponse {
        let query = ProfilesQuery(request: request)
        let data = try await client.request(query: query)

        return ProfilesResponse(response: data.profiles)
    }

    /**
     Creates a new user profile

     You create a request using the profile data you want to create. For example, given a selected handle, you can create a profile for a user with the following data:

     ```swift
     let profiles = Profiles()
     let request = CreateProfileRequest(handle: "kevinwo")
     let txHash = try await profiles.create(request: request)
     ```

     - Parameter request: The request parameters to use when creating the profile
     - Throws: An error if there is a problem with the creation operation.
     - Returns: A transaction hash
     */
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
