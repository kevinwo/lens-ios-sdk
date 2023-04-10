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
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "Lens",
      targets: ["Lens"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/apollographql/apollo-ios.git",
      .upToNextMajor(from: "1.0.0")
    ),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "Lens",
      dependencies: [
        .product(name: "Apollo", package: "apollo-ios"),
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      exclude: ["*.graphql", "*.graphqls"]
    ),
    .testTarget(
      name: "LensTests",
      dependencies: ["Lens"]),
  ]
)
