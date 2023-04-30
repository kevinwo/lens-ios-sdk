import Foundation

public protocol ProfilesType {
    func fetchAll(request: ProfileQueryRequest) async throws -> ProfilesResponse
    func fetch(request: SingleProfileQueryRequest) async throws -> ProfileResponse
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
     let walletAddress = "0x0c0E611A29b339D8c1048F2Edf9d4160A5fb8F22"
     let request = ProfileQueryRequest(ownedBy: [walletAddress])
     let response = try await profiles.fetchAll(request: request)
     ```

     - Parameter request: The request parameters to use when fetching profiles
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing profiles and page info
     */
    public func fetchAll(request: ProfileQueryRequest) async throws -> ProfilesResponse {
        let query = ProfilesQuery(request: request)
        let data = try await client.request(query: query)

        return ProfilesResponse(response: data.profiles)
    }

    /**
     Fetches a single user profile

     You create a request using criteria for fetching a single profile. For example, given a profile ID, to fetch a profile, you could do the following:

     ```swift
     let profiles = Profiles()
     let profileId = "0x12345"
     let request = SingleProfileQueryRequest(profileId: .init(stringLiteral: profileId))
     let response = try await profiles.fetch(request: request)
     ```

     - Parameter request: The request parameters to use when fetching a profile
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing the fetched profile
     */
    public func fetch(request: SingleProfileQueryRequest) async throws -> ProfileResponse {
        let query = ProfileQuery(request: request)
        let data = try await client.request(query: query)

        return ProfileResponse(profile: data.profile)
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

// MARK: - Responses

public struct ProfilesResponse {
    public let profiles: [any Profile]
    public let pageInfo: PageInfo?

    init(response: ProfilesQuery.Data.Profiles) {
        self.profiles = response.items
        self.pageInfo = PageInfo(dataDict: response.pageInfo.__data)
    }
}

public struct ProfileResponse {
    public let profile: (any Profile)?

    init(profile: ProfileQuery.Data.Profile?) {
        self.profile = profile
    }
}
