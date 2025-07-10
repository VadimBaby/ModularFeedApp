//
//  Settings.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 06.07.2025.
//

import ProjectDescription

public enum ModulesWithInterfaceTarget: String {
    case interfaces
    case impl
    
    public func target(for module: ModulesWithInterface) -> String {
        switch self {
        case .interfaces: module.title + "Interfaces"
        case .impl: module.title
        }
    }
    
    public func sources(for module: ModulesWithInterface) -> SourceFilesList {
        ["Sources/\(target(for: module))/**"]
    }
    public var product: Product { .framework }
}

public enum ModulesWithInterface: String, ProjectProtocol {
    case Networking
    case Persistance
    case API
    case LocalAPI
    case ImageLoader
    
    public var title: String { rawValue }
    public var rootFolder: String? {
        switch self {
        case .Networking, .Persistance:
            return "Packages"
        default:
            return nil
        }
    }
}
