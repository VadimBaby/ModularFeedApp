import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.DesignSystem.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(module: .DesignSystem, dependencies: [
            .simple(module: .Common),
            .simple(module: .CoreEntities)
        ])
    ]
)

