import Foundation

extension String {
    func toIpfsUrl() -> URL? {
        let urlString = replacingOccurrences(of: "ipfs://", with: "https://ipfs.io/ipfs/")
        return URL(string: urlString)
    }

    var asPrettyHandle: String {
        self
            .replacingOccurrences(of: ".test", with: "")
            .replacingOccurrences(of: ".lens", with: "")
    }
}
