import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ModulesWithInterface.LocalAPI.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            module: .LocalAPI,
            target: .impl,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities),
                .complex(module: .Persistance, target: .interfaces),
                .complex(module: .LocalAPI, target: .interfaces)
            ],
            coreDataModels: [.coreDataModel(.path("Sources/LocalAPI/Store/Model.xcdatamodeld"))]
        ),
        .complex(
            module: .LocalAPI,
            target: .interfaces,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities)
            ]
        )
    ]
)

