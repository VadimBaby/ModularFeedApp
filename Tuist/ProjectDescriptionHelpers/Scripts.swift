//
//  Scripts.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 06.07.2025.
//

import ProjectDescription

public enum Scripts: String {
    case swiftlint, swiftgen
    
    public var title: String {
        switch self {
        case .swiftlint: "SwiftLint"
        case .swiftgen: "SwiftGen"
        }
    }
    
    public var path: Path {
        Path.relativeToRoot("Scripts/\(self.rawValue).sh")
    }
}
