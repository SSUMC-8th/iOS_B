import ProjectDescription

let project = Project(
    name: "UMC_8",
    targets: [
        .target(
            name: "UMC_8",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.UMC-8",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["UMC_8/Sources/**"],
            resources: ["UMC_8/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "UMC_8Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.UMC-8Tests",
            infoPlist: .default,
            sources: ["UMC_8/Tests/**"],
            resources: [],
            dependencies: [.target(name: "UMC_8")]
        ),
    ]
)
