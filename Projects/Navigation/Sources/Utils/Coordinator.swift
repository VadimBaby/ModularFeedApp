//
//  Coordinator.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit

public protocol Coordinator: AnyObject {
    func start()
}

public protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}
