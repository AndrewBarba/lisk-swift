// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Lisk",
    dependencies: [
        .package(url: "https://github.com/AndrewBarba/Bluebird.swift.git", from: "2.0.1"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "0.8.0"),
        .package(url: "https://github.com/vzsg/ed25519.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "Lisk",
            dependencies: ["Bluebird", "CryptoSwift", "Ed25519"],
            path: "./Sources"
        ),
        .testTarget(
            name: "LiskTests",
            dependencies: ["Lisk"],
            path: "./Tests"
        )
    ],
    swiftLanguageVersions: [4]
)
