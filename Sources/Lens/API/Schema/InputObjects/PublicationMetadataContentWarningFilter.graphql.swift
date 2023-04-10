// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PublicationMetadataContentWarningFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    includeOneOf: GraphQLNullable<[GraphQLEnum<PublicationContentWarning>]> = nil
  ) {
    __data = InputDict([
      "includeOneOf": includeOneOf
    ])
  }

  public var includeOneOf: GraphQLNullable<[GraphQLEnum<PublicationContentWarning>]> {
    get { __data["includeOneOf"] }
    set { __data["includeOneOf"] = newValue }
  }
}
