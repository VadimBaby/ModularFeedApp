//
//  Post.swift
//  CoreEntities
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit

public struct Post {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String
    public let image: UIImage?
    public let isLiked: Bool
    
    public init(userId: Int, id: Int, title: String, body: String, image: UIImage? = nil, isLiked: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        self.image = image
        self.isLiked = isLiked
    }
}

// MARK: - CopyWith

public extension Post {
    func copyWith(
        image: UIImage? = nil,
        isLiked: Bool? = nil
    ) -> Post {
        Post(
            userId: userId,
            id: id,
            title: title,
            body: body,
            image: image ?? self.image,
            isLiked: isLiked ?? self.isLiked
        )
    }
}
