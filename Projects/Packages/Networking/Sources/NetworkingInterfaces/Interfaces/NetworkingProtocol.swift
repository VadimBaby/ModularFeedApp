//
//  NetworkingProtocol.swift
//  Networking
//
//  Created by Вадим Мартыненко on 07.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//
// swiftlint:disable:next foundation_using
import Foundation

public protocol NetworkingProtocol: AnyObject {
    func fetch<T: Decodable>(returnType: T.Type, router: Router) async throws -> T
    func fetchData(for urlString: String) async throws -> Data
}
