// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MyLibrary",
            targets: ["MyLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.8.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MyLibrary",
            dependencies: [
                "TextWithLink",
                "Component",
                "ListWithFilter",
                "APIClient"
            ]),
        .testTarget(
            name: "MyLibraryTests",
            dependencies: ["MyLibrary"]
        ),
        .target(
            name: "Component",
            dependencies: []
        ),
        .target(
            name: "TextWithLink",
            dependencies: []
        ),
        .testTarget(
            name: "TextWithLinkTests",
            dependencies: ["TextWithLink"]
        ),
        .target(
            name: "ListWithFilter",
            dependencies: []
        ),
        .target(
            name: "APIClient",
            dependencies: ["Alamofire"]
        ),
        .testTarget(
            name: "APIClientTests",
            dependencies: ["APIClient"]
        )
    ]
)

