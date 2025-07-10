//
//  LocalAPIAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import LocalAPIInterfaces
import LocalAPI
import PersistanceInterfaces
import DI

final class LocalAPIAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(PostsLocalAPIClientProtocol.self) { resolver in
            PostsLocalAPIClient(persistance: resolver.resolve(PersistanceProtocol.self)!)
        }
    }
}
