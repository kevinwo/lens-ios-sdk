import Foundation

public protocol ReactionsType {
    func add(request: ReactionRequest) async throws
    func remove(request: ReactionRequest) async throws
}

/**
 Add and remove reactions on a publication
 */
public final class Reactions: ReactionsType {
    // MARK: - Properties

    private let client: LensClientType = Current.lensClient()

    // MARK: - Object life cycle

    public init() {}

    // MARK: - Public interface

    /**
     Adds a reaction to a publication

     You create a request using criteria for adding a reaction. For example, you could do the following:

     ```swift
     let reactions = Reactions()
     let request = ReactionRequest(profileId: "0x0", reaction: .init(.upvote), publicationId: "0x12345")
     try await reactions.add(request: request)
     ```

     - Parameter request: The request parameters to use when fetching reactions
     - Throws: An error if there is a problem with the add operation.
     */
    public func add(request: ReactionRequest) async throws {
        let mutation = AddReactionMutation(request: request)
        _ = try await client.request(mutation: mutation)
    }

    /**
     Removes a reaction from a publication

     You create a request using criteria for removing a reaction. For example, you could do the following:

     ```swift
     let reactions = Reactions()
     let request = ReactionRequest(profileId: "0x0", reaction: .init(.upvote), publicationId: "0x12345")
     try await reactions.remove(request: request)
     ```

     - Parameter request: The request parameters to use when fetching a reaction
     - Throws: An error if there is a problem with the remove operation.
     */
    public func remove(request: ReactionRequest) async throws {
        let mutation = RemoveReactionMutation(request: request)
        _ = try await client.request(mutation: mutation)
    }
}
