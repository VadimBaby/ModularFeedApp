//
//  GetPostsUseCaseProtocol.swift
//  FeedDomain
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import Combine
import CoreEntities
import Common

public protocol GetPostsUseCaseProtocol: AnyObject {
    func execute() -> AnyPublisher<RepositoryLoadState<[Post]>, Never>
}

// MARK: - Mock

public final class MockGetPostsUseCase: GetPostsUseCaseProtocol {
    public init() {}
    
    public func execute() -> AnyPublisher<RepositoryLoadState<[Post]>, Never> {
        let posts = [
            Post(userId: 1, id: 1, title: "Mock", body: "Mock", isLiked: false)
        ]
        
        return Just(RepositoryLoadState.network(posts)).eraseToAnyPublisher()
    }
}
