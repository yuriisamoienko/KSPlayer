// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "KSPlayer",
    defaultLocalization: "en",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "KSPlayer",
            targets: ["KSPlayer", "FFmpeg"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        .target(
            name: "KSPlayer",
            dependencies: ["FFmpeg"],
            resources: [.process("Core/Resources"), .process("Metal/Shaders.metal")],
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("MetalKit"),
                .linkedFramework("Security"),
                .linkedFramework("VideoToolbox"),
            ]
        ),
        .target(
            name: "FFmpeg",
            dependencies: ["avcodec", "avfilter", "avformat", "avutil", "swresample", "swscale", "Libssl", "Libcrypto"],
//            dependencies: ["Libssl", "Libcrypto"],
//            exclude: ["include", "compat"],
//            cSettings: [
//                .headerSearchPath("compat"),
//                .headerSearchPath("compat/cuda"),
//                .headerSearchPath("include/libavcodec"),
//                .headerSearchPath("include/libavcodec/aarch64"),
//                .headerSearchPath("include/libavcodec/arm"),
//                .headerSearchPath("include/libavcodec/x86"),
//                .headerSearchPath("include/libavdevice"),
//                .headerSearchPath("include/libavfilter"),
//                .headerSearchPath("include/libavformat"),
//                .headerSearchPath("include/libavutil"),
//                .headerSearchPath("include/libswresample"),
//                .headerSearchPath("include/libswscale"),
//            ],
            linkerSettings: [
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
            ]
        ),
        .executableTarget(
            name: "BuildFFmpeg",
            dependencies: []
        ),
        .testTarget(
            name: "KSPlayerTests",
            dependencies: ["KSPlayer"],
            resources: [.process("Resources")]
        ),
        .binaryTarget(name: "avcodec", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avcodec.zip", checksum: "50fc7c75f51600f49539cef20826008813ff91722fe1c2269d6fb949621e56ae"),
        .binaryTarget(name: "avutil", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avutil.zip", checksum: "ea23b8e04c16ba47a05b2bb0b648f360ea4d7b51b527b0b3f7f502ed5ea4f1d8"),
        .binaryTarget(name: "avformat", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avformat.zip", checksum: "b4fedd70d28deb237314490d67899578984ce638e9702459484fdc53c373b7b7"),
        .binaryTarget(name: "avfilter", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avfilter.zip", checksum: "965b90de1324033ce2956f07e4cb05ba343af3e0a88faa09b42d263b332cb396"),
        .binaryTarget(name: "avdevice", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avdevice.zip", checksum: "492eec13b86009b2eb1c3ff2f0a41380bda230ec3f1c1d35b97f4e660ac56b6d"),
        .binaryTarget(name: "swscale", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/swscale.zip", checksum: "6430cab90b477a0bfdf0891ab4c5ce2eb26bed27c4eb46ffc1365e37c82b179d"),
        .binaryTarget(name: "swresample", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/swresample.zip", checksum: "ff2c8e9ef5b8acac334763acc308f418bb311ab8d628122c67a7ddcc7f78b550"),
        
//        .binaryTarget(name: "Libavcodec", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avcodec.zip", checksum: "50fc7c75f51600f49539cef20826008813ff91722fe1c2269d6fb949621e56ae"),
//        .binaryTarget(
//            name: "Libavcodec",
//            path: "Sources/Libavcodec.xcframework"
//        ),
//        .binaryTarget(name: "Libavfilter", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avfilter.zip", checksum: "965b90de1324033ce2956f07e4cb05ba343af3e0a88faa09b42d263b332cb396"),
//        .binaryTarget(
//            name: "Libavfilter",
//            path: "Sources/Libavfilter.xcframework"
//        ),
//        .binaryTarget(name: "Libavformat", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avformat.zip", checksum: "b4fedd70d28deb237314490d67899578984ce638e9702459484fdc53c373b7b7"),
//        .binaryTarget(
//            name: "Libavformat",
//            path: "Sources/Libavformat.xcframework"
//        ),
//        .binaryTarget(name: "Libavutil", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/avutil.zip", checksum: "ea23b8e04c16ba47a05b2bb0b648f360ea4d7b51b527b0b3f7f502ed5ea4f1d8"),
//        .binaryTarget(
//            name: "Libavutil",
//            path: "Sources/Libavutil.xcframework"
//        ),
//        .binaryTarget(name: "Libswresample", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/swresample.zip", checksum: "ff2c8e9ef5b8acac334763acc308f418bb311ab8d628122c67a7ddcc7f78b550"),
//        .binaryTarget(
//            name: "Libswresample",
//            path: "Sources/Libswresample.xcframework"
//        ),
//        .binaryTarget(name: "Libswscale", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/0.0.2/swscale.zip", checksum: "6430cab90b477a0bfdf0891ab4c5ce2eb26bed27c4eb46ffc1365e37c82b179d"),
//        .binaryTarget(
//            name: "Libswscale",
//            path: "Sources/Libswscale.xcframework"
//        ),
        .binaryTarget(
            name: "Libssl",
            path: "Sources/Libssl.xcframework"
        ),
        .binaryTarget(
            name: "Libcrypto",
            path: "Sources/Libcrypto.xcframework"
        ),
    ]
)
