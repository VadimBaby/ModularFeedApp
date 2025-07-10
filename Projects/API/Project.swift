import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ModulesWithInterface.API.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            module: .API,
            target: .impl,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities),
                .complex(module: .Networking, target: .interfaces),
                .complex(module: .API, target: .interfaces)
            ]
        ),
        .complex(
            module: .API,
            target: .interfaces,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities)
            ]
        )
    ]
)

