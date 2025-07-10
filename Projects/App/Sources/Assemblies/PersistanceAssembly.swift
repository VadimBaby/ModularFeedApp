//
//  PersistanceAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import PersistanceInterfaces
import Persistance
import DI
import LocalAPI

final class PersistanceAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(PersistanceProtocol.self) { _ in
            Persistance(model: LocalAPIConstants.MODEL_NAME, bundle: LocalAPIConstants.BUNDLE)
        }
    }
}
