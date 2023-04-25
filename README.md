# Lens iOS + macOS SDK

![CI](https://github.com/kevinwo/lens-ios-sdk/actions/workflows/CI.yml/badge.svg)

## Overview

The Lens SDK allows you to easily integrate a [Lens Protocol](https://www.lens.xyz) experience into your iOS or macOS app.

⚠️ The SDK is still pre-release and actively under development

## Installation

### Xcode

1. From the **File** menu, select **Add Packages…**.
2. Enter package repository URL: `https://github.com/kevinwo/lens-ios-sdk`
3. Confirm the branch is set to `main` (first release TBD), and click **Add Package**.
4. After the package downloads, verify the target in your project you would like to add the SDK to, and then click **Add Package**.

### Swift Package Manager

If you want to use Lens in any other project that uses [SwiftPM](https://swift.org/package-manager/), add the package as a dependency in `Package.swift`:

```swift
dependencies: [
  .package(
    url: "https://github.com/kevinwo/lens-ios-sdk",
    .branch("main")
  ),
]
```

## Getting Started

After installing the SDK, on initializing your app or library, configure the Lens client with your app name and bundle identifier (optional). For example:

```swift
LensClient.configure(appName: "MyApp")
```

The app name is currently used when generating a sign-in message for authentication. The bundle identifier is used when configuring the Keychain namespace for storing credentials.

## Documentation

After installing the SDK, from the **Product** menu in your project in Xcode, click **Build Documentation**. After the documentation finishes building and the documentation viewer appears, click **Lens** in the sidebar to browse.

After the initial release is published to the Swift Package Index, documentation will be available on the web, and a link will be included here.

## Contributing

There will likely be a number pre-release versions published, but my hope is to start accepting contributions in late May/early June, and will publish guidelines here! Until then, feel free to check out [the progress](https://github.com/users/kevinwo/projects/1).

## License

The source code to Lens and the example app is available under the MIT license. See the LICENSE file for more information.

Although technically allowed by the licensing terms, please do not just copy pasta the example app's code and submit your own version to the App Store.

## Hire me! 👨‍💻

I'm looking for interesting opportunities around Web3 and NFTs. If you like the way I write code, please feel free to get in touch!

## Contact

Kevin Wolkober

* [Lens](http://lenster.xyz/u/kevinwo)
* [LinkedIn](https://www.linkedin.com/in/kevinwolkober)
* [GitHub](https://github.com/kevinwo)
