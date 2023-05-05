import Foundation

public protocol PublicationsType {
    func fetchAll(request: PublicationsQueryRequest) async throws -> PublicationsResponse
    func fetch(request: PublicationQueryRequest) async throws -> PublicationResponse
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

     - Parameter request: The request parameters to use when fetching publications
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing publications and page info
     */
    public func fetchAll(request: PublicationsQueryRequest) async throws -> PublicationsResponse {
        let query = PublicationsQuery(request: request)
        let data = try await client.request(query: query)

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

     - Parameter request: The request parameters to use when fetching a publication
     - Throws: An error if there is a problem with the fetch operation.
     - Returns: A response containing the fetched publication
     */
    public func fetch(request: PublicationQueryRequest) async throws -> PublicationResponse {
        let query = PublicationQuery(request: request)
        let data = try await client.request(query: query)

        return PublicationResponse(publication: data.publication)
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
