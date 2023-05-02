// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PublicationQueryRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    publicationId: GraphQLNullable<InternalPublicationId> = nil,
    txHash: GraphQLNullable<TxHash> = nil
  ) {
    __data = InputDict([
      "publicationId": publicationId,
      "txHash": txHash
    ])
  }

  public var publicationId: GraphQLNullable<InternalPublicationId> {
    get { __data["publicationId"] }
    set { __data["publicationId"] = newValue }
  }

  public var txHash: GraphQLNullable<TxHash> {
    get { __data["txHash"] }
    set { __data["txHash"] = newValue }
  }
}
