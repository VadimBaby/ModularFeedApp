//
//  RefreshPostsUseCaseProtocol.swift
//  FeedDomainInterfaces
//
//  Created by Вадим Мартыненко on 10.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities

public protocol RefreshPostsUseCaseProtocol: AnyObject {
    func execute() async throws -> [Post]
}

// MARK: - Mock

public final class MockRefreshPostsUseCase: RefreshPostsUseCaseProtocol {
    public init() {}
    
    public func execute() async throws -> [Post] {
        []
    }
}
