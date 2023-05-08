// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct BroadcastRequest: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: BroadcastId,
    signature: Signature
  ) {
    __data = InputDict([
      "id": id,
      "signature": signature
    ])
  }

  public var id: BroadcastId {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var signature: Signature {
    get { __data["signature"] }
    set { __data["signature"] = newValue }
  }
}
