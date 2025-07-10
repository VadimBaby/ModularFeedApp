//
//  ServerPost.swift
//  API
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import Common

struct ServerPost: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

// MARK: - Convert To Domain

extension ServerPost {
    func toDomain() -> Post? {
        guard let id else { return nil }
        
        return Post(
            userId: userId.orZero,
            id: id,
            title: title.orEmpty,
            body: body.orEmpty,
            isLiked: false
        )
    }
}
