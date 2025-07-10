//
//  PostsAPIClient.swift
//  API
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import NetworkingInterfaces
import APIInterfaces
import CoreEntities

public final class PostsAPIClient: PostsAPIClientProtocol {
    private let networking: NetworkingProtocol
    
    public init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    private enum Endpoint: Router {
        case posts
        
        var baseURL: String { "https://jsonplaceholder.typicode.com" }
        
        var endpoint: String {
            switch self {
            case .posts: "posts"
            }
        }
        
        var method: HTTPMethod { .get }
    }
    
    public func getPosts() async throws -> [Post] {
        let serverPosts = try await networking.fetch(returnType: [ServerPost].self, router: Endpoint.posts)
        let posts = serverPosts.compactMap{ $0.toDomain() }
        return posts
    }
}
