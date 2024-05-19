// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftUIKit",
//    platforms: [
//        .iOS(.v16), .macOS(.v13), .macCatalyst(.v16), .tvOS(.v16), .watchOS(.v9)
//    ],
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v14), .watchOS(.v7), .visionOS(.v1)],
    products: [
        .library(
            name: "SwiftUIKit",
            targets: ["SwiftUIKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.11.0"),
    ],
    targets: [
        .target(
            name: "SwiftUIKit",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]
        ),
    ]
)
