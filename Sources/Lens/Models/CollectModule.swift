import Foundation

public typealias CollectModuleType = CollectModules

public protocol CollectModule {
    var type: CollectModuleType { get }
    var followerOnly: Bool { get }
    var amount: CollectAmount? { get }
    var limit: String? { get }
    var referralFee: Double? { get }
    var recipient: String? { get }
    var contractAddress: String? { get }
}

public struct CollectAmount {
    let asset: CollectAsset
    let value: String

    init?(fromDict dict: [String: AnyHashable]) {
        guard
            let assetDict = dict["asset"] as? [String: AnyHashable],
            let asset = CollectAsset(fromDict: assetDict),
            let value = dict["value"] as? String
        else {
            return nil
        }
        self.asset = asset
        self.value = value
    }
}

public struct CollectAsset {
    let name: String
    let symbol: String
    let decimals: Int
    let address: String

    init?(fromDict dict: [String: AnyHashable]) {
        guard
            let name = dict["name"] as? String,
            let symbol = dict["symbol"] as? String,
            let decimals = dict["decimals"] as? Int,
            let address = dict["address"] as? String
        else {
            return nil
        }
        self.name = name
        self.symbol = symbol
        self.decimals = decimals
        self.address = address
    }
}

extension PostFields.CollectModule: CollectModule {
    public var type: CollectModuleType { typeFromDataDict(__data) }
    public var followerOnly: Bool { followerOnlyFromDataDict(__data) }
    public var amount: CollectAmount? { collectAmountFromDataDict(__data) }
    public var limit: String? { limitFromDataDict(__data) }
    public var referralFee: Double? { referralFeeFromDataDict(__data) }
    public var recipient: String? { recipientFromDataDict(__data) }
    public var contractAddress: String? { contractAddressFromDataDict(__data) }
}

extension CommentBaseFields.CollectModule: CollectModule {
    public var type: CollectModuleType { typeFromDataDict(__data) }
    public var followerOnly: Bool { followerOnlyFromDataDict(__data) }
    public var amount: CollectAmount? { collectAmountFromDataDict(__data) }
    public var limit: String? { limitFromDataDict(__data) }
    public var referralFee: Double? { referralFeeFromDataDict(__data) }
    public var recipient: String? { recipientFromDataDict(__data) }
    public var contractAddress: String? { contractAddressFromDataDict(__data) }
}

extension MirrorBaseFields.CollectModule: CollectModule {
    public var type: CollectModuleType { typeFromDataDict(__data) }
    public var followerOnly: Bool { followerOnlyFromDataDict(__data) }
    public var amount: CollectAmount? { collectAmountFromDataDict(__data) }
    public var limit: String? { limitFromDataDict(__data) }
    public var referralFee: Double? { referralFeeFromDataDict(__data) }
    public var recipient: String? { recipientFromDataDict(__data) }
    public var contractAddress: String? { contractAddressFromDataDict(__data) }
}

// MARK: - Private interface

fileprivate func typeFromDataDict(_ dataDict: DataDict) -> CollectModuleType {
    guard let typename = dataDict._data["__typename"] as? String else {
        return .unknownCollectModule
    }
    return CollectModules(rawValue: typename.replacingOccurrences(of: "Settings", with: "")) ?? .unknownCollectModule
}

fileprivate func followerOnlyFromDataDict(_ dataDict: DataDict) -> Bool {
    dataDict._data["followerOnly"] as? Bool ?? false
}

fileprivate func collectAmountFromDataDict(_ dataDict: DataDict) -> CollectAmount? {
    guard let amount = dataDict._data["amount"] as? [String: AnyHashable] else {
        return nil
    }
    return CollectAmount(fromDict: amount)
}

fileprivate func limitFromDataDict(_ dataDict: DataDict) -> String? {
    dataDict._data["limit"] as? String
}

fileprivate func referralFeeFromDataDict(_ dataDict: DataDict) -> Double? {
    dataDict._data["referralFee"] as? Double
}

fileprivate func recipientFromDataDict(_ dataDict: DataDict) -> String? {
    dataDict._data["recipient"] as? String
}

fileprivate func contractAddressFromDataDict(_ dataDict: DataDict) -> String? {
    dataDict._data["contractAddress"] as? String
}
