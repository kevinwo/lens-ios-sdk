// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct ReferenceModuleFields: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment ReferenceModuleFields on ReferenceModule {
      __typename
      ... on FollowOnlyReferenceModuleSettings {
        type
        contractAddress
      }
      ... on UnknownReferenceModuleSettings {
        type
        contractAddress
        referenceModuleReturnData
      }
      ... on DegreesOfSeparationReferenceModuleSettings {
        type
        contractAddress
        commentsRestricted
        mirrorsRestricted
        degreesOfSeparation
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Unions.ReferenceModule }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .inlineFragment(AsFollowOnlyReferenceModuleSettings.self),
    .inlineFragment(AsUnknownReferenceModuleSettings.self),
    .inlineFragment(AsDegreesOfSeparationReferenceModuleSettings.self),
  ] }

  public var asFollowOnlyReferenceModuleSettings: AsFollowOnlyReferenceModuleSettings? { _asInlineFragment() }
  public var asUnknownReferenceModuleSettings: AsUnknownReferenceModuleSettings? { _asInlineFragment() }
  public var asDegreesOfSeparationReferenceModuleSettings: AsDegreesOfSeparationReferenceModuleSettings? { _asInlineFragment() }

  /// AsFollowOnlyReferenceModuleSettings
  ///
  /// Parent Type: `FollowOnlyReferenceModuleSettings`
  public struct AsFollowOnlyReferenceModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = ReferenceModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowOnlyReferenceModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.ReferenceModules>.self),
      .field("contractAddress", Lens.ContractAddress.self),
    ] }

    public var type: GraphQLEnum<Lens.ReferenceModules> { __data["type"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
  }

  /// AsUnknownReferenceModuleSettings
  ///
  /// Parent Type: `UnknownReferenceModuleSettings`
  public struct AsUnknownReferenceModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = ReferenceModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.UnknownReferenceModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.ReferenceModules>.self),
      .field("contractAddress", Lens.ContractAddress.self),
      .field("referenceModuleReturnData", Lens.ReferenceModuleData.self),
    ] }

    public var type: GraphQLEnum<Lens.ReferenceModules> { __data["type"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
    public var referenceModuleReturnData: Lens.ReferenceModuleData { __data["referenceModuleReturnData"] }
  }

  /// AsDegreesOfSeparationReferenceModuleSettings
  ///
  /// Parent Type: `DegreesOfSeparationReferenceModuleSettings`
  public struct AsDegreesOfSeparationReferenceModuleSettings: Lens.InlineFragment {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public typealias RootEntityType = ReferenceModuleFields
    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.DegreesOfSeparationReferenceModuleSettings }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("type", GraphQLEnum<Lens.ReferenceModules>.self),
      .field("contractAddress", Lens.ContractAddress.self),
      .field("commentsRestricted", Bool.self),
      .field("mirrorsRestricted", Bool.self),
      .field("degreesOfSeparation", Int.self),
    ] }

    public var type: GraphQLEnum<Lens.ReferenceModules> { __data["type"] }
    public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
    public var commentsRestricted: Bool { __data["commentsRestricted"] }
    public var mirrorsRestricted: Bool { __data["mirrorsRestricted"] }
    public var degreesOfSeparation: Int { __data["degreesOfSeparation"] }
  }
}
