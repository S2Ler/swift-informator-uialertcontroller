// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
      targets: ["Informator_UIAlertController"]),
  ],
  dependencies: [
    .package(url: "https://github.com/diejmon/Informator.git",
             .branch("master")),
    .package(url: "https://github.com/diejmon/SystemWindowController.git",
             .branch("master"))
  ],
  targets: [
    .target(
      name: "Informator_UIAlertController",
      dependencies: [
        "Informator",
        "SystemWindowController",
      ]),
    
    ]
)
