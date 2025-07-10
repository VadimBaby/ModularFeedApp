import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.App.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            module: .App,
            resources: Constants.DEFAULT_LOCATE_RESOURCES,
            dependencies: [
                .simple(module: .DI),
                .simple(module: .Navigation),
                .simple(module: .Common),
                .complex(module: .Networking, target: .impl),
                .complex(module: .Networking, target: .interfaces),
                .complex(module: .ImageLoader, target: .impl),
                .complex(module: .ImageLoader, target: .interfaces),
                .complex(module: .Persistance, target: .impl),
                .complex(module: .Persistance, target: .interfaces),
                .complex(module: .LocalAPI, target: .impl),
                .complex(module: .LocalAPI, target: .interfaces),
                .complex(module: .API, target: .impl),
                .complex(module: .API, target: .interfaces),
                .feature(.Feed, module: .Data),
                .feature(.Feed, module: .DataInterfaces),
                .feature(.Feed, module: .Domain),
                .feature(.Feed, module: .DomainInterfaces)
            ]
        )
    ]
)
