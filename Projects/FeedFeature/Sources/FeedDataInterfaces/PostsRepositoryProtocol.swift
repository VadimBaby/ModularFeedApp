//
//  PostsRepositoryProtocol.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import Combine
import Common
import UIKit
public protocol PostsRepositoryProtocol: AnyObject {
    func getPosts() -> AnyPublisher<RepositoryLoadState<[Post]>, Never>
    func loadImageForPost(_ post: Post) async throws -> UIImage?
    func refreshPosts() async throws -> [Post]
    func likePost(_ post: Post) async throws
}
