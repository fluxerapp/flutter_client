// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "fluxer_voice",
    platforms: [
        .macOS("12.0")
    ],
    products: [
        .library(name: "fluxer-voice", targets: ["fluxer_voice"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "fluxer_voice",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
