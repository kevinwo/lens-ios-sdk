// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PublicationMetadataFilters: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    locale: GraphQLNullable<Locale> = nil,
    contentWarning: GraphQLNullable<PublicationMetadataContentWarningFilter> = nil,
    mainContentFocus: GraphQLNullable<[GraphQLEnum<PublicationMainFocus>]>,
    tags: GraphQLNullable<PublicationMetadataTagsFilter> = nil
  ) {
    __data = InputDict([
      "locale": locale,
      "contentWarning": contentWarning,
      "mainContentFocus": mainContentFocus,
      "tags": tags
    ])
  }

  public var locale: GraphQLNullable<Locale> {
    get { __data["locale"] }
    set { __data["locale"] = newValue }
  }

  public var contentWarning: GraphQLNullable<PublicationMetadataContentWarningFilter> {
    get { __data["contentWarning"] }
    set { __data["contentWarning"] = newValue }
  }

  public var mainContentFocus: GraphQLNullable<[GraphQLEnum<PublicationMainFocus>]> {
    get { __data["mainContentFocus"] }
    set { __data["mainContentFocus"] = newValue }
  }

  public var tags: GraphQLNullable<PublicationMetadataTagsFilter> {
    get { __data["tags"] }
    set { __data["tags"] = newValue }
  }
}
