//
//  LoadState.swift
//  Common
//
//  Created by Вадим Мартыненко on 09.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public enum RepositoryLoadState<T> {
    case loading
    case error(_ error: Error)
    case persistance(_ result: T)
    case network(_ result: T)
}
