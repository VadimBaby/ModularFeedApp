//
//  NetworkError.swift
//  Networking
//
//  Created by Вадим Мартыненко on 04.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import LocalAPIInterfaces
import PersistanceInterfaces
import CoreEntities
import CoreData

public final class PostsLocalAPIClient: PostsLocalAPIClientProtocol {
    private let persistance: PersistanceProtocol
    
    public init(persistance: PersistanceProtocol) {
        self.persistance = persistance
    }
    
    public func getPosts() async throws -> [Post] {
        let dbPosts = try await persistance.fetch(type: DBPost.self)
        let posts = dbPosts.map{ PostMapper.toDomain(from: $0) }.sorted(by: { $0.id < $1.id })
        return posts
    }
    
    public func addPosts(_ posts: [Post]) async throws {
        try await persistance.createMany { context in
            for post in posts {
                let dbPost = DBPost(context: context)
                dbPost.id = Int64(post.id)
                dbPost.userId = Int64(post.userId)
                dbPost.title = post.title
                dbPost.body = post.body
                dbPost.isLiked = post.isLiked
            }
        }
    }
    
    public func resetPosts() async throws {
        try await persistance.deleteAll(type: DBPost.self)
    }
    
    public func likePost(_ post: Post) async throws {
        guard let entity = try await persistance.fetch(by: post.id, type: DBPost.self) else { return }
        try await persistance.update(entity: entity) { updatedEntity in
            updatedEntity.isLiked = !updatedEntity.isLiked
        }
    }
}
