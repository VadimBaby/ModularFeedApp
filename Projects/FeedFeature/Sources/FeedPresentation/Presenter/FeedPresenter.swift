//
//  FeedPresenter.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import UIKit
// swiftlint:disable:next foundation_using
import Foundation

protocol FeedPresenterOutput: AnyObject {
    
}

protocol FeedPresenterInput: AnyObject {
    var output: FeedPresenterOutput? { get set }
}

final class FeedPresenter: FeedPresenterInput {
    weak var output: FeedPresenterOutput?
    
    private unowned let view: FeedViewInput
    private let interactor: FeedInteractorInput
    
    init(view: FeedViewInput, interactor: FeedInteractorInput) {
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - FeedViewOutput

extension FeedPresenter: FeedViewOutput {
    func viewDidLoad() {
        interactor.loadPosts()
    }
    
    func postDidDisplay(_ post: Post, indexPath: IndexPath) {
        interactor.loadImageForPost(post, indexPath: indexPath)
    }
    
    func refreshDidStart() {
        interactor.refreshPosts()
    }
    
    func heartDidPress(_ post: Post) {
        interactor.likePost(post)
    }
}

// MARK: - FeedInteractorOutput

extension FeedPresenter: FeedInteractorOutput {
    func postsDidLoad(_ posts: [Post]) {
        view.setPosts(posts)
    }
    
    func startLoading() {
        view.showLoader()
    }
    
    func showError(_ error: Error) {
        view.showError(error)
    }
    
    func imageDidLoaded(_ image: UIImage, indexPath: IndexPath) {
        view.showImageForPost(image, indexPath: indexPath)
    }
}
