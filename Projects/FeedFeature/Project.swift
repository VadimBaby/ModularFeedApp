import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.Feed.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .feature(
            .Feed,
            target: .Presentation,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities),
                .simple(module: .DesignSystem),
                .feature(.Feed, module: .DomainInterfaces),
                .simple(module: .DI),
                .simple(module: .FeatureCommon),
                .feature(.Feed, module: .Domain)
            ]
        ),
        .feature(
            .Feed,
            target: .Domain,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities),
                .feature(.Feed, module: .DataInterfaces),
                .feature(.Feed, module: .DomainInterfaces)
            ]
        ),
        .feature(
            .Feed,
            target: .Data,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities),
                .feature(.Feed, module: .DataInterfaces),
                .complex(module: .ImageLoader, target: .interfaces),
                .complex(module: .API, target: .interfaces),
                .complex(module: .LocalAPI, target: .interfaces)
            ]
        ),
        .feature(
            .Feed,
            target: .DataInterfaces,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities)
            ]
        ),
        .feature(
            .Feed,
            target: .DomainInterfaces,
            dependencies: [
                .simple(module: .Common),
                .simple(module: .CoreEntities)
            ]
        )
    ]
)

