// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "fluxer_voice",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .library(name: "fluxer-voice", targets: ["fluxer_voice"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(name: "flutter_webrtc", path: "../flutter_webrtc")
    ],
    targets: [
        .target(
            name: "fluxer_voice",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "flutter-webrtc", package: "flutter_webrtc"),
                .product(name: "WebRTC", package: "flutter_webrtc")
            ]
        )
    ]
)
