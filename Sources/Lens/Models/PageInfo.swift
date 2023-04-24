import Foundation

/**
 The info for a given page of fetched results, used to fetch subsequent pages.

 The generated GraphQL interface for page info does not correctly capture the pertinent properties for cursors as the page info JSON section formatting is currently invalid, so we must manually parse this info ourselves.
 */
public struct PageInfo: Equatable {
    let prev: PageCursor
    let next: PageCursor

    init?(dataDict: DataDict) {
        guard
            /// Verify cursor string data exists
            let prevDictString = dataDict._data["prev"] as? String,
            let nextDictString = dataDict._data["next"] as? String,

            /// Parse into raw data
            let prevDictData = prevDictString.data(using: .utf8),
            let nextDictData = nextDictString.data(using: .utf8),

            /// Parse into dictionaries
            let prevDict = try? JSONSerialization.jsonObject(with: prevDictData, options: []) as? [String: AnyHashable],
            let nextDict = try? JSONSerialization.jsonObject(with: nextDictData, options: []) as? [String: AnyHashable],

            /// Create valid cursors
            let prev = PageCursor(dict: prevDict),
            let next = PageCursor(dict: nextDict)
        else {
            return nil
        }

        self.prev = prev
        self.next = next
    }
}

public struct PageCursor: Equatable {
    let timestamp: Int
    let offset: Int
    let randomizer: Int?

    init?(dict: [String: AnyHashable]) {
        guard
            let timestamp = dict["timestamp"] as? Int,
            let offset = dict["offset"] as? Int
        else {
            return nil
        }

        self.timestamp = timestamp
        self.offset = offset
        self.randomizer = dict["randomizer"] as? Int
    }
}
