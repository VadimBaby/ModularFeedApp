//
//  FeedFeatureAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import FeedDomainInterfaces
import FeedDomain
import FeedDataInterfaces
import FeedData
import LocalAPIInterfaces
import APIInterfaces
import ImageLoaderInterfaces

final class FeedFeatureAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(PostsRepositoryProtocol.self) { resolver in
            PostsRepository(
                networkDataSource: resolver.resolve(PostsAPIClientProtocol.self)!,
                localDataSource: resolver.resolve(PostsLocalAPIClientProtocol.self)!,
                imageLoader: resolver.resolve(ImageLoaderProtocol.self)!
            )
        }
        
        container.register(GetPostsUseCaseProtocol.self) { resolver in
            GetPostsUseCase(repository: resolver.resolve(PostsRepositoryProtocol.self)!)
        }
        
        container.register(GetImageForPostUseCaseProtocol.self) { resolver in
            GetImageForPostUseCase(repository: resolver.resolve(PostsRepositoryProtocol.self)!)
        }
        
        container.register(RefreshPostsUseCaseProtocol.self) { resolver in
            RefreshPostsUseCase(repository: resolver.resolve(PostsRepositoryProtocol.self)!)
        }
        
        container.register(LikePostUseCaseProtocol.self) { resolver in
            LikePostUseCase(repository: resolver.resolve(PostsRepositoryProtocol.self)!)
        }
    }
}
