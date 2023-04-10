// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PublicationMetadataTagsFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    oneOf: GraphQLNullable<[String]> = nil,
    all: GraphQLNullable<[String]> = nil
  ) {
    __data = InputDict([
      "oneOf": oneOf,
      "all": all
    ])
  }

  public var oneOf: GraphQLNullable<[String]> {
    get { __data["oneOf"] }
    set { __data["oneOf"] = newValue }
  }

  public var all: GraphQLNullable<[String]> {
    get { __data["all"] }
    set { __data["all"] = newValue }
  }
}
