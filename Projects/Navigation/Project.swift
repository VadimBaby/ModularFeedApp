import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.Navigation.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            module: .Navigation,
            dependencies: [
                .simple(module: .Common),
                .feature(.Feed, module: .Presentation)
            ]
        )
    ]
)
