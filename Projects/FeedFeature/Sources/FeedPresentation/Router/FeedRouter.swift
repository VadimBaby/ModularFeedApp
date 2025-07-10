//
//  FeedRouter.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit
import FeatureCommon

public protocol FeedRouterOutput: AnyObject {
    
}

public protocol FeedRouterInput: Router {
    var delegate: FeedRouterOutput? { get set }
    
    func open()
}

final class FeedRouter: FeedRouterInput {
    weak var delegate: FeedRouterOutput?
    
    let navigationController: UINavigationController
    
    typealias ModuleAssembly = (_ router: FeedPresenterOutput) -> FeedViewInput & UIViewController
    
    private let moduleAssembly: ModuleAssembly
    
    init(
        navigationController: UINavigationController,
        moduleAssembly: @escaping ModuleAssembly
    ) {
        self.navigationController = navigationController
        self.moduleAssembly = moduleAssembly
    }
    
    func open() {
        let module = moduleAssembly(self)
        navigationController.pushViewController(module, animated: true)
    }
}

// MARK: - FeedPresenterOutput

extension FeedRouter: FeedPresenterOutput {
    
}
