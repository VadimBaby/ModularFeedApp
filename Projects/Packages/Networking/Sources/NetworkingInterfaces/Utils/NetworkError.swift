//
//  NetworkError.swift
//  Networking
//
//  Created by Вадим Мартыненко on 04.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public enum NetworkError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case invalidResponse
    case dataConversionFailure
}
