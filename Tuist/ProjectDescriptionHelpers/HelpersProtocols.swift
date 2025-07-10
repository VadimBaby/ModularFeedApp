//
//  HelpersProtocols.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 06.07.2025.
//

import ProjectDescription

public protocol ProjectProtocol {
    var title: String { get }
    var path: Path { get }
    var rootFolder: String? { get }
}

public extension ProjectProtocol {
    var path: Path {
        var relativePath = title
        
        if let rootFolder {
            relativePath = "\(rootFolder)/\(relativePath)"
        }
        
        return "//Projects/\(relativePath)"
    }
}

public protocol DependencyProtocol {
    var target: String { get }
    var sources: SourceFilesList { get }
    var product: Product { get }
}
