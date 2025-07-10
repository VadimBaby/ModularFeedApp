import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ModulesWithInterface.ImageLoader.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            module: .ImageLoader,
            target: .impl,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities),
                .complex(module: .ImageLoader, target: .interfaces)
            ]
        ),
        .complex(
            module: .ImageLoader,
            target: .interfaces,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities)
            ]
        )
    ]
)

