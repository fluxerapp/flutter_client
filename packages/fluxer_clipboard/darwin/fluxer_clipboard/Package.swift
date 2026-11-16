// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "fluxer_clipboard",
    platforms: [
        .iOS("16.0"),
        .macOS("12.0")
    ],
    products: [
        .library(name: "fluxer-clipboard", targets: ["fluxer_clipboard"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "fluxer_clipboard",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
