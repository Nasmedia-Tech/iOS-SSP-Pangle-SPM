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
            exact: "7.1.1-release.1"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.0.7"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationPangleBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationPangle1.0.0.xcframework.zip",
            checksum: "87c3b21545db75742926bb700b7adfc780c1f08b25597940bbef1edeb9bbaf75"
        ),
        .target(
            name: "iOS_SSP_Pangle_SPM",
            dependencies: [
                "AdMixerMediationPangleBinary",
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
                .product(name: "AdMixerMediation", package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-Pangle-SPM",
            linkerSettings: [
                .unsafeFlags(["-ObjC"], .when(platforms: [.iOS]))
            ]
        )
    ]
)
