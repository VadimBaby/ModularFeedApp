//
//  PrivateZoneFlowCoordinatorFactory.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit
import DI
import FeedPresentation

final class PrivateZoneFlowCoordinatorFactory {
    static func create(
        window: UIWindow,
        resolver: Resolver
    ) -> PrivateZoneFlowCoordinatorInput {
        PrivateZoneFlowCoordinator(
            window: window,
            resolver: resolver,
            feedRouterAssembly: FeedAssembly.router
        )
    }
}
