// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Lens",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "Lens",
      targets: ["Lens"]
    ),
    .library(
      name: "LensTestData",
      targets: ["LensTestData"]
    ),
    .library(
      name: "LensTestTools",
      targets: ["LensTestTools"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/apollographql/apollo-ios.git",
      .upToNextMajor(from: "1.0.0")
    ),
    .package(
      url: "https://github.com/pointfreeco/swift-snapshot-testing",
      from: "1.10.0"
    ),
    .package(
      url: "https://github.com/kishikawakatsumi/KeychainAccess.git",
      from: "4.2.2"
    )
  ],
  targets: [
    // Lens
    .target(
      name: "Lens",
      dependencies: [
        .product(name: "Apollo", package: "apollo-ios"),
        .product(name: "ApolloAPI", package: "apollo-ios"),
        "KeychainAccess"
      ]
    ),
    .testTarget(
      name: "LensTests",
      dependencies: [
        "Lens",
        "LensTestData",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ]
    ),

    // Lens Test Data
    .target(
      name: "LensTestData",
      dependencies: [
        "Lens"
      ],
      swiftSettings: [
        .define("DEBUG", .when(configuration: .debug))
      ]
    ),

    // Lens Test Tools
    .target(
      name: "LensTestTools",
      dependencies: [
        "Lens"
      ],
      linkerSettings: [
        .linkedFramework(
          "XCTest",
          .when(platforms: [.macOS, .iOS, .watchOS, .tvOS])),
      ]
    ),
    .testTarget(
      name: "LensTestToolsTests",
      dependencies: ["LensTestTools"]
    ),
  ]
)
