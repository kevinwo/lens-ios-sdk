// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ReactionRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    profileId: ProfileId,
    reaction: GraphQLEnum<ReactionTypes>,
    publicationId: InternalPublicationId
  ) {
    __data = InputDict([
      "profileId": profileId,
      "reaction": reaction,
      "publicationId": publicationId
    ])
  }

  public var profileId: ProfileId {
    get { __data["profileId"] }
    set { __data["profileId"] = newValue }
  }

  public var reaction: GraphQLEnum<ReactionTypes> {
    get { __data["reaction"] }
    set { __data["reaction"] = newValue }
  }

  public var publicationId: InternalPublicationId {
    get { __data["publicationId"] }
    set { __data["publicationId"] = newValue }
  }
}
