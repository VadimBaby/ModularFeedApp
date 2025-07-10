//
//  Router.swift
//  Networking
//
//  Created by Вадим Мартыненко on 07.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//
// swiftlint:disable:next foundation_using
import Foundation

public protocol Router {
    var baseURL: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
}

public extension Router {
    func makeURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + "/" + endpoint) else { throw NetworkError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = method.getMethod()
        return request
    }
}
