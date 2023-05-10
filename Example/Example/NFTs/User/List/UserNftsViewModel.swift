import Foundation
import Lens

final class UserNftsViewModel: ObservableObject {
    // MARK: - Enums

    enum State {
        case isLoading
        case hasNfts
        case noNfts
    }

    // MARK: - Properties

    @Published var state: State = .isLoading
    @Published var isLoadingMore: Bool = false
    @Published var nfts = [NFT]()
    @Published var pageInfo: PageInfo?

    // TODO: Support Polygon mainnet
    private let chainId = 80001

    // MARK: - Internal interface

    func onAppear() async {
        await fetchNfts()
    }

    func onRowAppear(for nft: NFT) async {
        if nfts.last == nft {
            await fetchNextPage()
        }
    }

    // MARK: - Private interface

    @MainActor
    private func fetchNextPage() async {
        guard let pageInfo else {
            return
        }

        isLoadingMore = true

        do {
            let ownerAddress = try await Current.wallet.address()
            let request = NFTsRequest(
                cursor: .init(stringLiteral: pageInfo.next),
                ownerAddress: ownerAddress,
                chainIds: [chainId]
            )
            let results = try await Current.nfts.fetch(request: request)
            nfts.append(contentsOf: results.items)
            self.pageInfo = results.pageInfo
        } catch {
            // TODO: Handle error
        }

        isLoadingMore = false
    }

    @MainActor
    private func fetchNfts() async {
        /// We only want to show the loading indicator the first time the view appears or if the list remains empty after fetch
        if nfts.isEmpty {
            state = .isLoading
        }

        do {
            let walletAddress = try await Current.wallet.address()
            let request = NFTsRequest(ownerAddress: walletAddress, chainIds: [chainId])
            let results = try await Current.nfts.fetch(request: request)
            nfts = results.items

            /// There's probably a better way to deal with this, but for some reason the API returns a value for the next page, even if there isn't one. If we just set the page info anyway, it will cause an infinite list of NFTs for the same page.
            self.pageInfo = {
                if
                    results.pageInfo?.next == "{\"mumbai\":null}" || results.pageInfo?.next == "{\"polygon\":null}" {
                    return nil
                } else {
                    return results.pageInfo
                }
            }()
        } catch {
            // TODO: Handle error
        }

        if !nfts.isEmpty {
            state = .hasNfts
        } else {
            state = .noNfts
        }
    }
}
