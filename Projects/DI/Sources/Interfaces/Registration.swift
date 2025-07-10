//
//  Registration.swift
//  ShiftTest
//
//  Created by Вадим Мартыненко on 03.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public protocol Registration: AnyObject {
    @discardableResult func register(_ type: Any.Type, name: String?, constructor: @escaping ((Resolver) -> Any)) -> RegistrationConfigurator
}

public extension Registration {
    @discardableResult func register(_ type: Any.Type, name: String? = nil, constructor: @escaping ((Resolver) -> Any)) -> RegistrationConfigurator {
        register(type, name: name, constructor: constructor)
    }
}
