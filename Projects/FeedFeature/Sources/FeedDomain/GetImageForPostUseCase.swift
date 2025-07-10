//
//  GetImageForPostUseCase.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 09.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import FeedDataInterfaces
import UIKit
import FeedDomainInterfaces

public final class GetImageForPostUseCase: GetImageForPostUseCaseProtocol {
    private let repository: PostsRepositoryProtocol
    
    public init(repository: PostsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(post: Post) async throws -> UIImage? {
        try await repository.loadImageForPost(post)
    }
}
