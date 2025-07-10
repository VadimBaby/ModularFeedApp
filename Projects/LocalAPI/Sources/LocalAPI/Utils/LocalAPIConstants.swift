//
//  LocalAPIConstants.swift
//  LocalAPI
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//
// swiftlint:disable:next foundation_using
import Foundation

private class BundleFinder {}

public struct LocalAPIConstants {
    // swiftlint:disable:next identifier_name
    public static let MODEL_NAME = "Model"
    public static let BUNDLE = Bundle(for: BundleFinder.self)
}
