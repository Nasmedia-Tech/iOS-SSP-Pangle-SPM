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
            from: "2.1.8"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationPangleBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationPangle1.0.5-beta2.xcframework.zip",
            checksum: "2acf61ea18a92c079b6b02a78c86d70f33b792f15a08e98ac8c957bb1ffe3a33"
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
