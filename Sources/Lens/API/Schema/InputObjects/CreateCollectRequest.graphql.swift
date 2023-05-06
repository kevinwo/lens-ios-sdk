// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreateCollectRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    publicationId: InternalPublicationId,
    unknownModuleData: GraphQLNullable<BlockchainData> = nil
  ) {
    __data = InputDict([
      "publicationId": publicationId,
      "unknownModuleData": unknownModuleData
    ])
  }

  public var publicationId: InternalPublicationId {
    get { __data["publicationId"] }
    set { __data["publicationId"] = newValue }
  }

  public var unknownModuleData: GraphQLNullable<BlockchainData> {
    get { __data["unknownModuleData"] }
    set { __data["unknownModuleData"] = newValue }
  }
}
