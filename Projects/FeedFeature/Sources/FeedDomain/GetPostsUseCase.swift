//
//  GetPostsUseCase.swift
//  FeedDomain
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import Combine
import FeedDomainInterfaces
import FeedDataInterfaces
import Common

public final class GetPostsUseCase: GetPostsUseCaseProtocol {
    private let repository: PostsRepositoryProtocol
    
    public init(repository: PostsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() -> AnyPublisher<RepositoryLoadState<[Post]>, Never> {
        repository.getPosts()
    }
}
