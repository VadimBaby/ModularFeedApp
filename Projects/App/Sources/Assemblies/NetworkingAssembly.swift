//
//  NetworkingAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 07.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import Networking
import NetworkingInterfaces

final class NetworkingAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(NetworkingProtocol.self) { _ in
            Networking()
        }
    }
}
