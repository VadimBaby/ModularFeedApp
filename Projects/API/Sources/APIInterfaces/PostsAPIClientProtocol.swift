//
//  PostsAPIClientProtocol.swift
//  API
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities

public protocol PostsAPIClientProtocol: AnyObject {
    func getPosts() async throws -> [Post]
}
