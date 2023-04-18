import XCTest
@testable import Apollo
@testable import Lens

final class WorldTests: XCTestCase {
    var world: World!

    // MARK: - Test life cycle

    override func setUpWithError() throws {
        world = World()
    }

    override func tearDownWithError() throws {
        world = nil
    }

    // MARK: - Tests

    func test_init() throws {
        // when
        let world = World()

        // then
        // it should set up the Apollo client
        guard let apolloClient = world.apolloClient as? ApolloClient else {
            XCTFail("Production Apollo client should be in use")
            return
        }

        guard let networkTransport = apolloClient.networkTransport as? RequestChainNetworkTransport else {
            XCTFail("Network transport should be of type RequestChainNetworkTransport")
            return
        }

        XCTAssertTrue(networkTransport.interceptorProvider is LensInterceptorProvider)
    }
}
