//
//  a.swift
//  LocalAPI
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities

public protocol PostsLocalAPIClientProtocol: AnyObject {
    func getPosts() async throws -> [Post]
    func resetPosts() async throws
    func addPosts(_ posts: [Post]) async throws
    func likePost(_ post: Post) async throws
}
