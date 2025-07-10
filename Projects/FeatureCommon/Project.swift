import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.FeatureCommon.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            module: .FeatureCommon,
            dependencies: [
                .simple(module: .Common)
            ]
        )
    ]
)
