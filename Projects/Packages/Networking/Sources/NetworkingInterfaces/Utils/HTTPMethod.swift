//
//  HTTPMethod.swift
//  Networking
//
//  Created by Вадим Мартыненко on 07.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public enum HTTPMethod: String {
    case get, post, put, delete
    
    func getMethod() -> String {
        return rawValue.uppercased()
    }
}
