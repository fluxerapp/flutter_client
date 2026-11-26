// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "fluxer_macos",
    platforms: [
        .macOS("12.0")
    ],
    products: [
        .library(name: "fluxer-macos", targets: ["fluxer_macos"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "fluxer_macos",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
