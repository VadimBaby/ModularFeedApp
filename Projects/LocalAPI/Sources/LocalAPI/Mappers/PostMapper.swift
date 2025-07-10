//
//  PostMapper.swift
//  LocalAPI
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import CoreData
import Common

struct PostMapper {
    static func toDomain(from dbModel: DBPost) -> Post {
        Post(
            userId: Int(dbModel.userId),
            id: Int(dbModel.id),
            title: dbModel.title.orEmpty,
            body: dbModel.body.orEmpty,
            isLiked: dbModel.isLiked
        )
    }
}
