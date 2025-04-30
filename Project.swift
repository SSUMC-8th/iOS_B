import ProjectDescription

let project = Project(
    name: "Starbucks",
    targets: [
        .target(
            name: "Starbucks",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Starbucks",
            infoPlist: .extendingDefault(
                with: [
                    "NSCameraUsageDescription": "카메라 기능을 사용하려면 권한이 필요합니다.",
                    "NSLocationWhenInUseUsageDescription": "앱 사용 중 위치 정보 접근을 허용해 주세요",
                    "NSLocationAlwaysUsageDescription": "앱이 백그라운드에서도 위치를 사용하려면 허용해 주세요",
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": ""
                    ]
                ]
            ),
            sources: ["Starbucks/Sources/**"],
            resources: ["Starbucks/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "StarbucksTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.StarbucksTests",
            infoPlist: .default,
            sources: ["Starbucks/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Starbucks")]
        ),
    ]
)
