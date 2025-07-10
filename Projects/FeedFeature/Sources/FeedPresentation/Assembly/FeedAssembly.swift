//
//  FeedAssembly.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit
import DI
import FeedDomainInterfaces
import FeedDomain

public final class FeedAssembly {
    private init() {}
    
    static func create(
        router: FeedPresenterOutput,
        resolver: Resolver
    ) -> UIViewController & FeedViewInput {
        let view = FeedView()
        
        let interactor = FeedInteractor(
            getPostsUseCase: resolver.resolve(GetPostsUseCaseProtocol.self)!,
            getImageForPostUseCase: resolver.resolve(GetImageForPostUseCaseProtocol.self)!,
            refreshPostsUseCase: resolver.resolve(RefreshPostsUseCaseProtocol.self)!,
            likePostUseCase: resolver.resolve(LikePostUseCaseProtocol.self)!
        )
        
        let presenter = FeedPresenter(view: view, interactor: interactor)
        
        view.output = presenter
        interactor.output = presenter
        
        presenter.output = router
        
        return view
    }
    
    public static func router(
        navigationController: UINavigationController,
        resolver: Resolver
    ) -> FeedRouterInput {
        let router = FeedRouter(
            navigationController: navigationController,
            moduleAssembly: { create(router: $0, resolver: resolver) }
        )
        
        return router
    }
}

// MARK: - Mock

#if DEBUG
extension FeedAssembly {
    static func createMock() -> UIViewController & FeedViewInput {
        let view = FeedView()
        
        let interactor = FeedInteractor(
            getPostsUseCase: MockGetPostsUseCase(),
            getImageForPostUseCase: MockGetImageForPostUseCase(),
            refreshPostsUseCase: MockRefreshPostsUseCase(),
            likePostUseCase: MockLikePostUseCase()
        )
        
        let presenter = FeedPresenter(view: view, interactor: interactor)
        
        view.output = presenter
        interactor.output = presenter
        
        return view
    }
}
#endif
