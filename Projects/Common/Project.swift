import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.Common.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(module: .Common)
    ]
)

