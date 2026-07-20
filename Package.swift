// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdMixerMediationPangle",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdMixerMediationPangle",
            targets: ["iOS_SSP_Pangle_SPM"]),
    ],
    dependencies: [
        // Pangle SDK
        .package(
            url: "https://github.com/bytedance/AdsGlobalPackage.git",
            "7.4.1-release.1"..<"7.9.0-release.7"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.4.2"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationPangleBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Pangle-SPM/releases/download/1.2.1/AdMixerMediationPangle1.2.1.xcframework.zip",
            checksum: "fdedcefa0326c8afba199953a01dc7e7a1a2ff8a56d9073bbca06673391b7536"
        ),
        .target(
            name: "iOS_SSP_Pangle_SPM",
            dependencies: [
                "AdMixerMediationPangleBinary",
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
                .product(name: "AdMixerMediation", package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-Pangle-SPM"
        )
    ]
)
