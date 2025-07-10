//
//  GetImageForPostUseCase.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 09.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import UIKit

public protocol GetImageForPostUseCaseProtocol: AnyObject {
    func execute(post: Post) async throws -> UIImage?
}

// MARK: - Mock

public final class MockGetImageForPostUseCase: GetImageForPostUseCaseProtocol {
    public init() {}
    
    public func execute(post: Post) async throws -> UIImage? {
        return UIImage.checkmark
    }
}
