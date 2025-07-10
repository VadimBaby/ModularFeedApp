//
//  Resolver.swift
//  DI
//
//  Created by Вадим Мартыненко on 07.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public protocol Resolver: AnyObject {
    func resolve<T>(_ type: T.Type, name: String?) -> T?
}

public extension Resolver {
    func resolve<T>(_ type: T.Type, name: String? = nil) -> T? {
        resolve(type, name: name)
    }
}
