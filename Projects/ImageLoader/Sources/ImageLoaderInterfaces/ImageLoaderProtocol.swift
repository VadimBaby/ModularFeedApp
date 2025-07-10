//
//  ImageLoaderProtocol.swift
//  ImageLoader
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation
import UIKit

public protocol ImageLoaderProtocol: AnyObject {
    func download(for itemId: Int) async throws -> UIImage
    func clearCache() async throws
}
