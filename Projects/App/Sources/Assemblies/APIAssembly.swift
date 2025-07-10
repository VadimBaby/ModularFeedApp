//
//  APIAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import NetworkingInterfaces
import API
import APIInterfaces

final class APIAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(PostsAPIClientProtocol.self) { resolver in
            PostsAPIClient(networking: resolver.resolve(NetworkingProtocol.self)!)
        }
    }
}
