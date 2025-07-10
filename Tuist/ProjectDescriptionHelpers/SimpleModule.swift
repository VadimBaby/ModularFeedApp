//
//  SimpleModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 06.07.2025.
//

import ProjectDescription

public enum SimpleModule: String, ProjectProtocol, DependencyProtocol {
    case App, Common, CoreEntities, DesignSystem, DI, Navigation, FeatureCommon
    
    public var title: String { rawValue }
    
    public var rootFolder: String? { nil }
    
    public var target: String { rawValue }
    public var sources: SourceFilesList { ["Sources/**"] }
    public var product: Product {
        guard self == .App else { return .framework }
        return .app
    }
}
