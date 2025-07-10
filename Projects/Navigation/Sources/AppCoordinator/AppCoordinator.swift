//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit
import DI
import Common

public protocol AppCoordinatorInput: Coordinator {
    func start()
}

final class AppCoordinator: AppCoordinatorInput {
    private let window: UIWindow
    private let resolver: Resolver
    
    typealias PrivateZoneCoordinatorAssembly = (_ window: UIWindow, _ resolver: Resolver) -> PrivateZoneFlowCoordinatorInput
    
    private let privateZoneCoordinatorAssembly: PrivateZoneCoordinatorAssembly
    
    private var privateZoneCoordinator: PrivateZoneFlowCoordinatorInput?
    
    init(
        window: UIWindow,
        resolver: Resolver,
        privateZoneCoordinatorAssembly: @escaping PrivateZoneCoordinatorAssembly
    ) {
        self.window = window
        self.resolver = resolver
        self.privateZoneCoordinatorAssembly = privateZoneCoordinatorAssembly
    }
    
    func start() {
        presentPrivateZone()
    }
}

// MARK: - Presents

private extension AppCoordinator {
    func presentPrivateZone() {
        if privateZoneCoordinator.isNil {
            privateZoneCoordinator = privateZoneCoordinatorAssembly(window, resolver)
        }
        
        privateZoneCoordinator?.start()
    }
}
