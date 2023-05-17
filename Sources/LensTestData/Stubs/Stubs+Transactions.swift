import Foundation
import Lens
import XCTest

extension Stubs {
    public enum Transactions {
        public static func broadcast() throws -> BroadcastMutation.Data {
            let data = broadcast200ResponseJSON()
            var dict = try XCTUnwrap(try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyHashable])
            var dictData = try XCTUnwrap(dict["data"] as? [String: AnyHashable])
            var broadcast = try XCTUnwrap(dictData["broadcast"] as? [String: AnyHashable])
            broadcast["__fulfilled"] = Set([ObjectIdentifier(BroadcastMutation.Data.Broadcast.AsRelayerResult.self)])

            dictData["broadcast"] = broadcast
            dict["data"] = dictData

            let json = JSONValue(dict["data"])

            return BroadcastMutation.Data(
                _dataDict: .init(
                    data: try .init(_jsonValue: json)
                )
            )
        }

        public static func broadcast200ResponseJSON() -> Data {
            """
            {
              "data": {
                "broadcast": {
                  "txHash": "0x0",
                  "txId": "0x0"
                }
              }
            }
            """.data(using: .utf8)!
        }
    }
}
