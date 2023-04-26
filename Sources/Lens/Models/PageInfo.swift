import Foundation

/**
 The info for a given page of fetched results, used to fetch subsequent pages.
 */
public struct PageInfo: Equatable {
    public let prev: String
    public let next: String

    init?(dataDict: DataDict) {
        guard
            let prevDictString = dataDict._data["prev"] as? String,
            let nextDictString = dataDict._data["next"] as? String
        else {
            return nil
        }

        self.prev = prevDictString
        self.next = nextDictString
    }
}
