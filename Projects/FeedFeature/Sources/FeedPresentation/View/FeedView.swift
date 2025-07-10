//
//  FeedView.swift
//  FeedData
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit
import FeatureCommon
import CoreEntities
import DesignSystem
import Common

protocol FeedViewOutput: AnyObject {
    func viewDidLoad()
    func postDidDisplay(_ post: Post, indexPath: IndexPath)
    func refreshDidStart()
    func heartDidPress(_ post: Post)
}

protocol FeedViewInput: AnyObject {
    var output: FeedViewOutput? { get set }
    
    func setPosts(_ posts: [Post])
    func showLoader()
    func showError(_ error: Error)
    func showImageForPost(_ image: UIImage, indexPath: IndexPath)
}

final class FeedView: UIViewController, FeedViewInput {
    var output: FeedViewOutput?
    
    private lazy var tableView = UITableView(frame: view.bounds) &> {
        $0.delegate = self
        $0.dataSource = self
        $0.register(PostCellView.self, forCellReuseIdentifier: PostCellView.reuseId)
        $0.rowHeight = UITableView.automaticDimension
        $0.refreshControl = refreshControl
    }
    
    private lazy var loaderView = UIActivityIndicatorView(style: .medium) &> {
        $0.isHidden = true
        $0.hidesWhenStopped = true
    }
    
    private lazy var refreshControl = UIRefreshControl() &> {
        $0.addTarget(self, action: #selector(refreshDidStart), for: .valueChanged)
    }
    
    private var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        setupRootView()
        setupSubviews()
        setupConstraints()
    }
    
    func setPosts(_ posts: [Post]) {
        self.posts = posts
        loaderView.stopAnimating()
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    func showLoader() {
        loaderView.startAnimating()
    }
    
    func showImageForPost(_ image: UIImage, indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let postWithImage = post.copyWith(image: image)
        posts[indexPath.row] = postWithImage
        tableView.reconfigureRows(at: [indexPath])
    }
    
    func showError(_ error: Error) {
        let alertVC = UIAlertController(
            title: "Ошибка",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alertVC.addAction(.init(title: "OK", style: .default))
        present(alertVC, animated: true)
        loaderView.stopAnimating()
    }
}

// MARK: - Setup Subviews

private extension FeedView {
    func setupRootView() {
        navigationItem.title = "Главный экран"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(loaderView)
        
        loaderView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Private Methods

private extension FeedView {
    func postDidDisplay(with indexPath: IndexPath) {
        let post = posts[indexPath.row]
        output?.postDidDisplay(post, indexPath: indexPath)
    }
    
    @objc
    func refreshDidStart() {
        output?.refreshDidStart()
    }
    
    func heartDidPress(for indexPath: IndexPath) {
        let post = posts[indexPath.row]
        output?.heartDidPress(post)
    }
}

// MARK: - UITableViewDataSource

extension FeedView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCellView.reuseId, for: indexPath) as? PostCellView else {
            fatalError("Cant cast cell")
        }
        
        let post = posts[indexPath.row]
        
        cell.setup(with: post) { [weak self] in
            self?.heartDidPress(for: indexPath)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FeedView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        postDidDisplay(with: indexPath)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}

// MARK: - Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI
struct FeedViewPreview: PreviewProvider {
    static var previews: some View {
        UINavigationController(
            rootViewController: FeedAssembly.createMock()
        ).asPreview()
    }
}
#endif
