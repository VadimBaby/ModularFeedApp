//
//  RefreshPostsUseCase.swift
//  FeedDomainInterfaces
//
//  Created by Вадим Мартыненко on 10.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import FeedDataInterfaces
import FeedDomainInterfaces

public final class RefreshPostsUseCase: RefreshPostsUseCaseProtocol {
    private let repository: PostsRepositoryProtocol
    
    public init(repository: PostsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() async throws -> [Post] {
        try await repository.refreshPosts()
    }
}
