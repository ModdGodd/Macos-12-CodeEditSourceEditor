// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeEditTextView",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "CodeEditTextView",
            targets: ["CodeEditTextView"]
        ),
    ],
    dependencies: [
        .package(
            path: "/Users/tisu/Dev/SPM-Overrides/STTextView"
        ),
        .package(
            url: "https://github.com/CodeEditApp/CodeEditLanguages.git",
            exact: "0.1.15"
        ),
        .package(
            url: "https://github.com/lukepistrol/SwiftLintPlugin",
            from: "0.2.2"
        ),
        .package(
            url: "https://github.com/ChimeHQ/TextFormation",
            exact: "0.8.0"
        )
    ],
    targets: [
        .target(
            name: "CodeEditTextView",
            dependencies: [
                "STTextView",
                "CodeEditLanguages",
                "TextFormation"
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),

        .testTarget(
            name: "CodeEditTextViewTests",
            dependencies: [
                "CodeEditTextView",
                "CodeEditLanguages",
            ]
        ),
    ]
)
