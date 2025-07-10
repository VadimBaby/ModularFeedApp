//
//  Featured.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 06.07.2025.
//

import ProjectDescription

public enum FeatureModule: String {
    case Presentation, Domain, Data, DomainInterfaces, DataInterfaces
    
    public func target(for feature: Feature) -> String {
        feature.rawValue + self.rawValue
    }
    
    public func sources(for feature: Feature) -> SourceFilesList {
        ["Sources/\(target(for: feature))/**"]
    }
    public var product: Product { .framework }
}

public enum Feature: String, ProjectProtocol {
    case Feed
    
    public var title: String { rawValue + "Feature" }
    public var rootFolder: String? { nil }
}
