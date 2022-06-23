// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Chat",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Chat",
            targets: ["Chat"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/siteline/SwiftUI-Introspect.git",
            from: "0.1.4"
        ),
        .package(
            name: "AssetsPicker",
            path: "Components/AssetsPicker"
        )
    ],
    targets: [
        .target(
            name: "Chat",
            dependencies: [
                .product(name: "Introspect", package: "SwiftUI-Introspect"),
                "AssetsPicker",
            ]
        ),
        .testTarget(
            name: "ChatTests",
            dependencies: ["Chat"]),
    ]
)