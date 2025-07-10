//
//  PrivateZoneFlowCoordinator.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit
import DI
import FeedPresentation

protocol PrivateZoneFlowCoordinatorInput: NavigationCoordinator {
    func start()
}

final class PrivateZoneFlowCoordinator: PrivateZoneFlowCoordinatorInput {
    var navigationController: UINavigationController
    
    private let window: UIWindow
    private let resolver: Resolver
    
    typealias FeedRouterAssembly = (_ navigationController: UINavigationController, _ resolver: Resolver) -> FeedRouterInput
    
    private let feedRouterAssembly: FeedRouterAssembly
    
    private var feedRouter: FeedRouterInput?
    
    init(
        window: UIWindow,
        resolver: Resolver,
        navigationController: UINavigationController = UINavigationController(),
        feedRouterAssembly: @escaping FeedRouterAssembly
    ) {
        self.window = window
        self.resolver = resolver
        self.feedRouterAssembly = feedRouterAssembly
        self.navigationController = navigationController
    }
    
    func start() {
        openFeedRouter()
        window.rootViewController = navigationController
    }
}

// MARK: - Presents

private extension PrivateZoneFlowCoordinator {
    func openFeedRouter() {
        if feedRouter.isNil {
            feedRouter = feedRouterAssembly(navigationController, resolver)
            feedRouter?.delegate = self
        }
        
        feedRouter?.open()
    }
}

// MARK: - FeedRouterOutput

extension PrivateZoneFlowCoordinator: FeedRouterOutput {
    
}
