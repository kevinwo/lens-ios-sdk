import Foundation

extension URL {
    func toHttpLoadingIpfs() -> URL? {
        let urlString = self.absoluteString.replacingOccurrences(of: "ipfs://", with: "https://ipfs.io/ipfs/")
        return URL(string: urlString)
    }
}
