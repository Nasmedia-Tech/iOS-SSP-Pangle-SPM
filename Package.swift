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
            "7.4.1-release.1"..<"7.6.0-release.7"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.1.7"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationPangleBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationPangle1.0.4-be.xcframework.zip",
            checksum: "d5e52a72d1f07a07d281d6b537ea844888bd8c8fd42e3915a862a964ec39fb3f"
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
