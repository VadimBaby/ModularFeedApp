//
//  TargetDependency+Modules.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 06.07.2025.
//

import ProjectDescription

public extension TargetDependency {
    static func feature(_ feature: Feature, module: FeatureModule) -> TargetDependency {
        .project(target: module.target(for: feature), path: feature.path)
    }
    
    static func complex(
        module: ModulesWithInterface,
        target: ModulesWithInterfaceTarget
    ) -> TargetDependency {
        .project(target: target.target(for: module), path: module.path)
    }
    
    static func simple(module: SimpleModule) -> TargetDependency {
        .dependency(module)
    }
    
    static func dependency<T: DependencyProtocol & ProjectProtocol>(_ dependency: T) -> TargetDependency {
        .project(target: dependency.target, path: dependency.path)
    }
}
