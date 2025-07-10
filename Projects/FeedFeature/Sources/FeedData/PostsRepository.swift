//
//  PostsRepository.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import Common
import FeedDataInterfaces
import APIInterfaces
import LocalAPIInterfaces
import Combine
import CoreEntities
// swiftlint:disable:next foundation_using
import Foundation
import ImageLoaderInterfaces
import UIKit

public final class PostsRepository: PostsRepositoryProtocol {
    private let networkDataSource: PostsAPIClientProtocol
    private let localDataSource: PostsLocalAPIClientProtocol
    private let imageLoader: ImageLoaderProtocol
    
    public init(networkDataSource: PostsAPIClientProtocol, localDataSource: PostsLocalAPIClientProtocol, imageLoader: ImageLoaderProtocol) {
        self.networkDataSource = networkDataSource
        self.localDataSource = localDataSource
        self.imageLoader = imageLoader
    }
    
    private var canLoadImageForPosts = false
    
    public func refreshPosts() async throws -> [Post] {
        try await localDataSource.resetPosts()
        try await imageLoader.clearCache()
        
        let networkPosts = try await networkDataSource.getPosts()
        try await localDataSource.addPosts(networkPosts)
        return networkPosts
    }
    
    public func getPosts() -> AnyPublisher<RepositoryLoadState<[Post]>, Never> {
        canLoadImageForPosts = false
        
        let subject = CurrentValueSubject<RepositoryLoadState<[Post]>, Never>(.loading)
        
        Task {
            let localPosts = try? await localDataSource.getPosts()
            
            if let localPosts, localPosts.isNotEmpty {
                subject.send(.persistance(localPosts))
            }
            
            do {
                let posts = try await fetchAndStoreNetworkPosts(localPosts: localPosts)
                canLoadImageForPosts = true
                subject.send(.network(posts))
            } catch {
                subject.send(.error(error))
            }
        }
        
        return subject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func loadImageForPost(_ post: Post) async throws -> UIImage? {
        guard canLoadImageForPosts else { return nil }
        return try await imageLoader.download(for: post.id)
    }
    
    public func likePost(_ post: Post) async throws {
        try await localDataSource.likePost(post)
    }
}

// MARK: - Private Methods

private extension PostsRepository {
    func fetchAndStoreNetworkPosts(localPosts: [Post]?) async throws -> [Post] {
        let networkPosts = try await networkDataSource.getPosts()
        
        let mergedPosts = mergeLikes(from: localPosts, into: networkPosts)
        
        try await localDataSource.resetPosts()
        try await localDataSource.addPosts(mergedPosts)
        
        return mergedPosts
    }

    func mergeLikes(from localPosts: [Post]?, into networkPosts: [Post]) -> [Post] {
        guard let localPosts else { return networkPosts }
        
        return networkPosts.map { networkPost in
            guard let matched = localPosts.first(where: { $0.id == networkPost.id }) else {
                return networkPost
            }
            return networkPost.copyWith(isLiked: matched.isLiked)
        }
    }
}
