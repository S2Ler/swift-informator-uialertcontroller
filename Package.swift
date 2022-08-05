// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "swift-informator-uialertcontroller",
  platforms: [
    .iOS(.v13),
    .tvOS(.v13),
    .macOS(.v10_15),
  ],
  products: [
    .library(
      name: "Informator_UIAlertController",
      targets: ["Informator_UIAlertController"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/S2Ler/swift-informator.git",
      .upToNextMinor(from: "0.2.0")
    ),
    .package(
      url: "https://github.com/S2Ler/swift-window-controller.git",
      .upToNextMinor(from: "0.8.0")
    ),
  ],
  targets: [
    .target(
      name: "Informator_UIAlertController",
      dependencies: [
        .product(name: "Informator", package: "swift-informator"),
        .product(name: "WindowController", package: "swift-window-controller"),
      ]
    ),
  ]
)
