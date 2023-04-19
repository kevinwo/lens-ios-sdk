// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Lens.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Lens.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Lens.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Lens.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return Lens.Objects.Query
    case "PaginatedProfileResult": return Lens.Objects.PaginatedProfileResult
    case "Profile": return Lens.Objects.Profile
    case "Attribute": return Lens.Objects.Attribute
    case "NftImage": return Lens.Objects.NftImage
    case "MediaSet": return Lens.Objects.MediaSet
    case "Media": return Lens.Objects.Media
    case "Dispatcher": return Lens.Objects.Dispatcher
    case "ProfileStats": return Lens.Objects.ProfileStats
    case "FeeFollowModuleSettings": return Lens.Objects.FeeFollowModuleSettings
    case "ProfileFollowModuleSettings": return Lens.Objects.ProfileFollowModuleSettings
    case "RevertFollowModuleSettings": return Lens.Objects.RevertFollowModuleSettings
    case "UnknownFollowModuleSettings": return Lens.Objects.UnknownFollowModuleSettings
    case "ModuleFeeAmount": return Lens.Objects.ModuleFeeAmount
    case "Erc20": return Lens.Objects.Erc20
    case "OnChainIdentity": return Lens.Objects.OnChainIdentity
    case "EnsOnChainIdentity": return Lens.Objects.EnsOnChainIdentity
    case "SybilDotOrgIdentity": return Lens.Objects.SybilDotOrgIdentity
    case "SybilDotOrgIdentitySource": return Lens.Objects.SybilDotOrgIdentitySource
    case "SybilDotOrgTwitterIdentity": return Lens.Objects.SybilDotOrgTwitterIdentity
    case "WorldcoinIdentity": return Lens.Objects.WorldcoinIdentity
    case "PaginatedResultInfo": return Lens.Objects.PaginatedResultInfo
    case "ExplorePublicationResult": return Lens.Objects.ExplorePublicationResult
    case "Post": return Lens.Objects.Post
    case "Comment": return Lens.Objects.Comment
    case "Mirror": return Lens.Objects.Mirror
    case "PublicationStats": return Lens.Objects.PublicationStats
    case "MetadataOutput": return Lens.Objects.MetadataOutput
    case "MetadataAttributeOutput": return Lens.Objects.MetadataAttributeOutput
    case "EncryptionParamsOutput": return Lens.Objects.EncryptionParamsOutput
    case "ProviderSpecificParamsOutput": return Lens.Objects.ProviderSpecificParamsOutput
    case "AccessConditionOutput": return Lens.Objects.AccessConditionOutput
    case "NftOwnershipOutput": return Lens.Objects.NftOwnershipOutput
    case "EoaOwnershipOutput": return Lens.Objects.EoaOwnershipOutput
    case "Erc20OwnershipOutput": return Lens.Objects.Erc20OwnershipOutput
    case "ProfileOwnershipOutput": return Lens.Objects.ProfileOwnershipOutput
    case "FollowConditionOutput": return Lens.Objects.FollowConditionOutput
    case "CollectConditionOutput": return Lens.Objects.CollectConditionOutput
    case "AndConditionOutput": return Lens.Objects.AndConditionOutput
    case "OrConditionOutput": return Lens.Objects.OrConditionOutput
    case "EncryptedFieldsOutput": return Lens.Objects.EncryptedFieldsOutput
    case "EncryptedMediaSet": return Lens.Objects.EncryptedMediaSet
    case "EncryptedMedia": return Lens.Objects.EncryptedMedia
    case "FreeCollectModuleSettings": return Lens.Objects.FreeCollectModuleSettings
    case "FeeCollectModuleSettings": return Lens.Objects.FeeCollectModuleSettings
    case "LimitedFeeCollectModuleSettings": return Lens.Objects.LimitedFeeCollectModuleSettings
    case "LimitedTimedFeeCollectModuleSettings": return Lens.Objects.LimitedTimedFeeCollectModuleSettings
    case "RevertCollectModuleSettings": return Lens.Objects.RevertCollectModuleSettings
    case "TimedFeeCollectModuleSettings": return Lens.Objects.TimedFeeCollectModuleSettings
    case "MultirecipientFeeCollectModuleSettings": return Lens.Objects.MultirecipientFeeCollectModuleSettings
    case "ERC4626FeeCollectModuleSettings": return Lens.Objects.ERC4626FeeCollectModuleSettings
    case "AaveFeeCollectModuleSettings": return Lens.Objects.AaveFeeCollectModuleSettings
    case "UnknownCollectModuleSettings": return Lens.Objects.UnknownCollectModuleSettings
    case "FollowOnlyReferenceModuleSettings": return Lens.Objects.FollowOnlyReferenceModuleSettings
    case "UnknownReferenceModuleSettings": return Lens.Objects.UnknownReferenceModuleSettings
    case "DegreesOfSeparationReferenceModuleSettings": return Lens.Objects.DegreesOfSeparationReferenceModuleSettings
    case "Mutation": return Lens.Objects.Mutation
    case "RelayerResult": return Lens.Objects.RelayerResult
    case "RelayError": return Lens.Objects.RelayError
    case "AuthChallengeResult": return Lens.Objects.AuthChallengeResult
    case "PaginatedFeedResult": return Lens.Objects.PaginatedFeedResult
    case "FeedItem": return Lens.Objects.FeedItem
    case "ElectedMirror": return Lens.Objects.ElectedMirror
    case "MirrorEvent": return Lens.Objects.MirrorEvent
    case "CollectedEvent": return Lens.Objects.CollectedEvent
    case "ReactionEvent": return Lens.Objects.ReactionEvent
    case "AuthenticationResult": return Lens.Objects.AuthenticationResult
    case "TransactionReceipt": return Lens.Objects.TransactionReceipt
    case "Log": return Lens.Objects.Log
    case "Wallet": return Lens.Objects.Wallet
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
