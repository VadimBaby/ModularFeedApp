//
//  ImageLoader.swift
//  ImageLoader
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import ImageLoaderInterfaces
// swiftlint:disable:next foundation_using
import Foundation
import NetworkingInterfaces
import UIKit

public final class ImageLoader: ImageLoaderProtocol {
    private let networking: NetworkingProtocol
    
    private let cache = NSCache<NSNumber, NSData>()
    
    private let imageURL = "https://picsum.photos/1000"
    
    public init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    public func download(for itemId: Int) async throws -> UIImage {
        let cacheId = itemId as NSNumber
        
        if let data = cache.object(forKey: cacheId),
           let image = UIImage(data: data as Data) {
            return image
        }
        
        let data = try await networking.fetchData(for: imageURL)
        
        guard let image = UIImage(data: data) else { throw URLError(.badServerResponse) }
        
        cache.setObject(data as NSData, forKey: cacheId)
        
        return image
    }
    
    public func clearCache() async throws {
        cache.removeAllObjects()
    }
}
