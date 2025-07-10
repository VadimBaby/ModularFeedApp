import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ModulesWithInterface.Persistance.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            module: .Persistance,
            target: .impl,
            dependencies: [
                .simple(module: .Common),
                .complex(module: .Persistance, target: .interfaces)
            ]
        ),
        .complex(
            module: .Persistance,
            target: .interfaces,
            dependencies: [
                .simple(module: .Common)
            ]
        )
    ]
)
