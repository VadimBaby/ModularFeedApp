//
//  FeedInteractor.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import FeedDomainInterfaces
import CoreEntities
import Combine
// swiftlint:disable:next foundation_using
import Foundation
import UIKit

protocol FeedInteractorOutput: AnyObject {
    func postsDidLoad(_ posts: [Post])
    func showError(_ error: Error)
    func startLoading()
    func imageDidLoaded(_ image: UIImage, indexPath: IndexPath)
}

protocol FeedInteractorInput: AnyObject {
    var output: FeedInteractorOutput? { get set }
    
    func loadPosts()
    func loadImageForPost(_ post: Post, indexPath: IndexPath)
    func refreshPosts()
    func likePost(_ post: Post)
}

final class FeedInteractor: FeedInteractorInput {
    weak var output: FeedInteractorOutput?
    
    private let getPostsUseCase: GetPostsUseCaseProtocol
    private let getImageForPostUseCase: GetImageForPostUseCaseProtocol
    private let refreshPostsUseCase: RefreshPostsUseCaseProtocol
    private let likePostUseCase: LikePostUseCaseProtocol
    
    init(getPostsUseCase: GetPostsUseCaseProtocol, getImageForPostUseCase: GetImageForPostUseCaseProtocol, refreshPostsUseCase: RefreshPostsUseCaseProtocol, likePostUseCase: LikePostUseCaseProtocol) {
        self.getPostsUseCase = getPostsUseCase
        self.getImageForPostUseCase = getImageForPostUseCase
        self.refreshPostsUseCase = refreshPostsUseCase
        self.likePostUseCase = likePostUseCase
    }
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    func loadPosts() {
        getPostsUseCase.execute()
            .sink { [weak self] loadState in
                switch loadState {
                case .loading:
                    self?.output?.startLoading()
                case let .persistance(posts):
                    self?.output?.postsDidLoad(posts)
                case let .network(posts):
                    self?.output?.postsDidLoad(posts)
                case let .error(error):
                    self?.output?.showError(error)
                }
            }
            .store(in: &cancellables)
    }
    
    func refreshPosts() {
        Task {
            do {
                let posts = try await refreshPostsUseCase.execute()
                await MainActor.run {
                    output?.postsDidLoad(posts)
                }
            } catch {
                await MainActor.run {
                    output?.showError(error)
                }
            }
        }
    }
    
    func loadImageForPost(_ post: Post, indexPath: IndexPath) {
        Task {
            do {
                guard let image = try await getImageForPostUseCase.execute(post: post) else { return }
                await MainActor.run {
                    output?.imageDidLoaded(image, indexPath: indexPath)
                }
            } catch {
                await MainActor.run {
                    output?.showError(error)
                }
            }
        }
    }
    
    func likePost(_ post: Post) {
        Task {
            do {
                try await likePostUseCase.execute(post: post)
            } catch {
                await MainActor.run {
                    output?.showError(error)
                }
            }
        }
    }
}
