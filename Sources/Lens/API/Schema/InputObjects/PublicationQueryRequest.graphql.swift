// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PublicationQueryRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    publicationId: GraphQLNullable<InternalPublicationId>? = nil,
    txHash: GraphQLNullable<TxHash>? = nil
  ) {
      /// There appears to be an issue with the way the Apollo iOS library handles null arguments
      /// (or maybe the way the Lens GraphQL API handles them?). In any case, we need to work around
      /// this for now by manually not including any null arguments in this request.
    var dict = [String: any GraphQLOperationVariableValue]()
    if let publicationId { dict["publicationId"] = publicationId }
    if let txHash { dict["txHash"] = txHash }

    __data = InputDict(dict)
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
