// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "keri-swift",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "keri-swift",
            targets: ["keri-swift"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Sodium", url: "https://github.com/jedisct1/swift-sodium.git", .upToNextMajor(from: "0.9.1")),
        .package(name: "SwiftLMDB", url: "https://github.com/agisboye/SwiftLMDB.git", .upToNextMajor(from: "2.0.0")),
        .package(name: "BLAKE3", url: "https://github.com/nixberg/blake3-swift", branch: "master"),
        .package(url: "https://github.com/apple/swift-collections.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/apple/swift-log.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/swift-extras/swift-extras-base64.git", branch: "main"),
        .package(url: "https://github.com/a2/MessagePack.swift.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/unrelentingtech/SwiftCBOR", .upToNextMajor(from: "0.4.4")),
        .package(url: "https://github.com/m00sey/RNJSON.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "keri-swift",
            dependencies: [
                "Sodium",
                "SwiftLMDB",
                "BLAKE3",
                "SwiftCBOR",
                "RNJSON",
                .product(name: "MessagePack", package: "MessagePack.swift"),
                .product(name: "ExtrasBase64", package: "swift-extras-base64"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Collections", package: "swift-collections"),
            ]
        ),
        .testTarget(
            name: "keri-swiftTests",
            dependencies: ["keri-swift"]
        ),
    ]
)
