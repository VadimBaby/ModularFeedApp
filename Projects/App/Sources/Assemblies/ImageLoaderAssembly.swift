//
//  ImageLoaderAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 09.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import ImageLoaderInterfaces
import ImageLoader
import NetworkingInterfaces

final class ImageLoaderAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(ImageLoaderProtocol.self) { resolver in
            ImageLoader(networking: resolver.resolve(NetworkingProtocol.self)!)
        }
    }
}
