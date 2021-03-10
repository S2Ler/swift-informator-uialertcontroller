// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Informator_UIAlertController",
  platforms: [
    .iOS(.v10),
    .tvOS(.v10)
  ],
  products: [
    .library(
      name: "Informator_UIAlertController",
      targets: ["Informator_UIAlertController"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/S2Ler/Informator.git",
      .upToNextMajor(from: "0.1.0")
    ),
    .package(
      url: "https://github.com/S2Ler/SystemWindowController.git",
      .upToNextMajor(from: "0.7.0")
    )
  ],
  targets: [
    .target(
      name: "Informator_UIAlertController",
      dependencies: [
        "Informator",
        "SystemWindowController",
      ]
    ),
  ]
)
