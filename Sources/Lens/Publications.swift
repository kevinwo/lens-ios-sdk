import Foundation

public protocol PublicationsType {
    func fetchAll(request: PublicationsQueryRequest, observerId: String?) async throws -> PublicationsResponse
    func fetch(request: PublicationQueryRequest, observerId: String?) async throws -> PublicationResponse
    func createCollectTypedData(request: CreateCollectRequest) async throws -> CreateCollectTypedDataResponse
}

/**
 Fetch, create, and manage publications
 */
public final class Publications: PublicationsType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    /**
     Fetches multiple publications

     You create a request using criteria for fetching publications. For example, if you wanted to fetch all the publications belonging to a given user's profile, you could do the following:

     ```swift
     let publications = Publications()
     let profileId = "0x12345"
     let request = PublicationQueryRequest(profileId: .init(stringLiteral: profileId))
     let response = try await publications.fetchAll(request: request)
     ```

     - Parameters:
        - request: The request parameters to use when fetching publications
        - observerId: The profile ID for the signed-in user making the request (optional). This is used when you want to fetch state based on the user's participation (e.g. whether or not they upvoted a post).
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing publications and page info
     */
    public func fetchAll(request: PublicationsQueryRequest, observerId: String?) async throws -> PublicationsResponse {
        let query = PublicationsQuery(
            request: request,
            observerId: .value(for: observerId)
        )
        let data = try await client.request(query: query, cachePolicy: .default)

        return PublicationsResponse(response: data.publications)
    }

    /**
     Fetches a single user publication

     You create a request using criteria for fetching a single publication. For example, given a publication ID, to fetch a publication, you could do the following:

     ```swift
     let publications = Publications()
     let publicationId = "0x12345"
     let request = PublicationQueryRequest(publicationId: .init(stringLiteral: publicationId))
     let response = try await publications.fetch(request: request)
     ```

     - Parameters:
        - request: The request parameters to use when fetching a publication
        - observerId: The profile ID for the signed-in user making the request (optional). This is used when you want to fetch state based on the user's participation (e.g. whether or not they upvoted a post).
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing the fetched publication
     */
    public func fetch(request: PublicationQueryRequest, observerId: String?) async throws -> PublicationResponse {
        let query = PublicationQuery(
            request: request,
            observerId: .value(for: observerId)
        )
        let data = try await client.request(query: query, cachePolicy: .default)

        return PublicationResponse(publication: data.publication)
    }

    /**
     Creates typed data for collecting a publication.

     When a user does not have a dispatcher enabled for their wallet, they can still collect a publication by signing collect typed data and broadcasting. This method creates the typed data for the user to sign.

     You create a request using criteria for collecting a publication. For example, given a publication ID, to create collect typed data for a publication, you could do the following:

     ```swift
     let publications = Publications()
     let publicationId = "0x12345"
     let request = CreateCollectRequest(publicationId: publicationId)
     let response = try await publications.createCollectTypedData(request: request)
     ```

     - Parameter request: The request parameters to use when creating collect typed data
     - Throws: An error if there is a problem with the mutation operation.
     - Returns: A response containing the broadcast ID and the typed data to sign
     */
    public func createCollectTypedData(request: CreateCollectRequest) async throws -> CreateCollectTypedDataResponse {
        let mutation = CreateCollectTypedDataMutation(request: request, options: .null)
        let data = try await client.request(mutation: mutation)

        return try CreateCollectTypedDataResponse(result: data.result)
    }
}

// MARK: - Responses

public struct PublicationsResponse: Equatable {
    public let publications: [Publication]
    public let pageInfo: PageInfo?

    init(response: PublicationsQuery.Data.Publications) {
        self.publications = response.items.compactMap { Publication.fromItem($0) }
        self.pageInfo = PageInfo(dataDict: response.pageInfo.__data)
    }
}

public struct PublicationResponse: Equatable {
    public let publication: Publication?

    init(publication: PublicationQuery.Data.Publication?) {
        guard let publication else {
            self.publication = nil
            return
        }

        self.publication = Publication.fromItem(publication)
    }
}

public struct CreateCollectTypedDataResponse: Equatable {
    // MARK: - Enums

    enum Error: Swift.Error {
        case invalidJsonString
    }

    // MARK: - Properties

    /// Used to broadcast a gasless transaction for collecting a publication after the user has signed the collect typed data
    public let broadcastId: String

    /// Typed data representing the publication to collect, which the user will sign with their wallet
    public let typedData: String

    // MARK: - Object life cycle

    init(result: CreateCollectTypedDataMutation.Data.Result) throws {
        func cleanTypedDataDict(_ dict: [String: Any]) -> [String: Any] {
            var cleanedDict = dict
            for (key, value) in cleanedDict {
                if ["chainId", "nonce", "deadline"].contains(key), let value = value as? String {
                    /// Various values in the GraphQL response come back as string, but we need them to be integers for the typed data to be valid.
                    cleanedDict[key] = Int(value)
                } else if ["__typename", "__fulfilled"].contains(key) {
                    /// The GraphQL response muddies the typed data structure with GraphQL-specific data, so we need to remove this in order to avoid sending malformed data to a wallet for signing.
                    cleanedDict.removeValue(forKey: key)
                } else if let nestedDict = value as? [String: Any] {
                    cleanedDict[key] = cleanTypedDataDict(nestedDict)
                } else if let nestedArray = value as? [[String: Any]] {
                    cleanedDict[key] = nestedArray.map { cleanTypedDataDict($0) }
                }
            }
            return cleanedDict
        }

        let typedData = result.typedData
        let domain = cleanTypedDataDict(typedData.domain.__data._data)
        var types = cleanTypedDataDict(typedData.types.__data._data)
        let value = cleanTypedDataDict(typedData.value.__data._data)

        /// The domain types are not included in the types dictionary, so we need to add it manually for the typed data to be value
        types["EIP712Domain"] = [
            [
                "name": "name",
                "type": "string"
            ],
            [
                "name": "version",
                "type": "string"
            ],
            [
                "name": "chainId",
                "type": "uint256"
            ],
            [
                "name": "verifyingContract",
                "type": "address"
            ]
        ]

        let dict: [String: Any] = [
            "domain": domain,
            "types": types,
            "message": value,
            "primaryType": "CollectWithSig"
        ]
        let jsonData = try JSONSerialization.data(withJSONObject: dict)

        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            throw Error.invalidJsonString
        }

        self.broadcastId = result.id
        self.typedData = jsonString
    }
}
