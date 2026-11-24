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
            name: "fluxer_noise_filter",
            exclude: [
                "noise_filter.cmake",
                "test",
                "third_party/rnnoise/COPYING",
                "third_party/rnnoise/src/x86",
                "third_party/speexdsp/COPYING"
            ],
            publicHeadersPath: "include",
            cSettings: [
                .define("OUTSIDE_SPEEX"),
                .define("FLOATING_POINT"),
                .define("RANDOM_PREFIX", to: "fnf_speex"),
                .headerSearchPath("compat"),
                .headerSearchPath("third_party/rnnoise/include"),
                .headerSearchPath("third_party/rnnoise/src"),
                .headerSearchPath("third_party/speexdsp")
            ],
            cxxSettings: [
                .define("OUTSIDE_SPEEX"),
                .define("FLOATING_POINT"),
                .define("RANDOM_PREFIX", to: "fnf_speex"),
                .headerSearchPath("third_party/rnnoise/include"),
                .headerSearchPath("third_party/speexdsp")
            ]
        ),
        .target(
            name: "fluxer_voice",
            dependencies: [
                "fluxer_noise_filter",
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "flutter-webrtc", package: "flutter_webrtc"),
                .product(name: "WebRTC", package: "flutter_webrtc")
            ]
        )
    ],
    cxxLanguageStandard: .cxx17
)
