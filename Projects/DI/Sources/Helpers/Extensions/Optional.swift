//
//  Optional.swift
//  DI
//
//  Created by Вадим Мартыненко on 07.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

protocol OptionalProtocol {
    static var wrappedType: Any.Type { get }
}

extension Optional: OptionalProtocol {
    static var wrappedType: Any.Type { return Wrapped.self }
}
