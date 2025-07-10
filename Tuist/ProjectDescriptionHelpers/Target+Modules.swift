//
//  Target+Modules.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 06.07.2025.
//

import ProjectDescription

public extension Target {
    static func simple(
        module: SimpleModule,
        resources: ResourceFileElements? = nil,
        enabledSwiftGen: Bool = false,
        otherScript: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        coreDataModels: [CoreDataModel] = []
    ) -> Target {
        .myTarget(
            name: module.target,
            product: module.product,
            source: module.sources,
            resources: resources,
            swiftLint: .swiftlint(),
            swiftGen: enabledSwiftGen ? .swiftgen() : nil,
            otherScripts: otherScript,
            dependencies: dependencies,
            coreDataModels: coreDataModels
        )
    }
    
    static func feature(
        _ feature: Feature,
        target: FeatureModule,
        dependencies: [TargetDependency] = []
    ) -> Target {
        .myTarget(
            name: target.target(for: feature),
            product: target.product,
            infoPlist: .default,
            source: target.sources(for: feature),
            resources: nil,
            swiftLint: .swiftlint(),
            swiftGen: nil,
            otherScripts: [],
            dependencies: dependencies,
            coreDataModels: []
        )
    }
    
    static func complex(
        module: ModulesWithInterface,
        target: ModulesWithInterfaceTarget,
        dependencies: [TargetDependency] = [],
        coreDataModels: [CoreDataModel] = []
    ) -> Target {
        .myTarget(
            name: target.target(for: module),
            product: target.product,
            infoPlist: .default,
            source: target.sources(for: module),
            resources: nil,
            swiftLint: .swiftlint(countInnerFolder: module.rootFolder == nil ? 0 : 1),
            swiftGen: nil,
            otherScripts: [],
            dependencies: dependencies,
            coreDataModels: coreDataModels
        )
    }
}
