//
//  PostCellView.swift
//  DesignSystem
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit
import CoreEntities
import Common

public final class PostCellView: UITableViewCell {
    private var onLikePress: VoidAction?
    
    public static let reuseId = "\(PostCellView.self)"
    
    private lazy var avatarView = UIImageView() &> {
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    private lazy var loaderView = UIActivityIndicatorView(style: .medium) &> {
        $0.hidesWhenStopped = true
        $0.isHidden = true
    }
    
    private lazy var titleLabel = UILabel() &> {
        $0.numberOfLines = 0
        $0.font = .preferredFont(forTextStyle: .title1)
    }
    
    private lazy var bodyLabel = UILabel() &> {
        $0.numberOfLines = 0
    }
    
    private lazy var heartButton = UILikeButton() &> {
        $0.addTarget(self, action: #selector(onHeartPress), for: .touchUpInside)
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(with post: Post, onLikePress: VoidAction? = nil) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
        heartButton.isLiked = post.isLiked
        self.onLikePress = onLikePress
        
        if let image = post.image {
            showImage(image)
        } else {
            showLoader()
        }
    }
}

// MARK: - Private Methods

private extension PostCellView {
    func showImage(_ image: UIImage) {
        loaderView.stopAnimating()
        avatarView.image = image
        avatarView.isHidden = false
    }
    
    func showLoader() {
        loaderView.startAnimating()
        avatarView.isHidden = true
    }
    
    @objc
    func onHeartPress() {
        onLikePress?()
    }
}

// MARK: - Setup

private extension PostCellView {
    func setupSubviews() {
        [titleLabel, bodyLabel, loaderView, avatarView, heartButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupConsraints() {
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -8),
            loaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            loaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            loaderView.heightAnchor.constraint(equalTo: contentView.widthAnchor, constant: -18),
            
            avatarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -8),
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            avatarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            avatarView.heightAnchor.constraint(equalTo: contentView.widthAnchor, constant: -18),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: loaderView.bottomAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            bodyLabel.bottomAnchor.constraint(equalTo: heartButton.topAnchor, constant: -8),
            
            heartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            heartButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 8),
            heartButton.widthAnchor.constraint(equalToConstant: 30),
            heartButton.heightAnchor.constraint(equalToConstant: 30),
            heartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
