//
//  LIkePostUseCaseProtocol.swift
//  FeedDomainInterfaces
//
//  Created by Вадим Мартыненко on 10.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities

public protocol LikePostUseCaseProtocol: AnyObject {
    func execute(post: Post) async throws
}

// MARK: - Mock

public final class MockLikePostUseCase: LikePostUseCaseProtocol {
    public init() {}
    
    public func execute(post: Post) async throws {
        
    }
}
