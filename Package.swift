// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TypedIdentifier",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .watchOS(.v6),
    .tvOS(.v13)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "TypedIdentifier",
      targets: ["TypedIdentifier"]
    )
  ],
  targets: [
    .target(name: "TypedIdentifier"),
  ],
  swiftLanguageModes: [.v6]
)

