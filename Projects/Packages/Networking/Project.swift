import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ModulesWithInterface.Networking.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            module: .Networking,
            target: .impl,
            dependencies: [
                .simple(module: .Common),
                .complex(module: .Networking, target: .interfaces)
            ]
        ),
        .complex(
            module: .Networking,
            target: .interfaces,
            dependencies: [
                .simple(module: .Common)
            ]
        )
    ]
)
