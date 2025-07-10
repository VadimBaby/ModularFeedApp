//
//  AppCoordinatorFactory.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import UIKit

public final class AppCoordinatorFactory {
    public static func create(
        window: UIWindow,
        resolver: Resolver
    ) -> AppCoordinatorInput {
        AppCoordinator(
            window: window,
            resolver: resolver,
            privateZoneCoordinatorAssembly: PrivateZoneFlowCoordinatorFactory.create
        )
    }
}
