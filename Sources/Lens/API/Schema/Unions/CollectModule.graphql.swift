// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Unions {
  static let CollectModule = Union(
    name: "CollectModule",
    possibleTypes: [
      Objects.FreeCollectModuleSettings.self,
      Objects.FeeCollectModuleSettings.self,
      Objects.LimitedFeeCollectModuleSettings.self,
      Objects.LimitedTimedFeeCollectModuleSettings.self,
      Objects.RevertCollectModuleSettings.self,
      Objects.TimedFeeCollectModuleSettings.self,
      Objects.MultirecipientFeeCollectModuleSettings.self,
      Objects.ERC4626FeeCollectModuleSettings.self,
      Objects.AaveFeeCollectModuleSettings.self,
      Objects.UnknownCollectModuleSettings.self
    ]
  )
}