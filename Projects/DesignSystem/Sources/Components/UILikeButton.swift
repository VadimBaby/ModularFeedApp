//
//  UILikeButton.swift
//  DesignSystem
//
//  Created by Вадим Мартыненко on 10.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import UIKit

public final class UILikeButton: UIButton {
    public var isLiked: Bool = false {
        didSet {
            if isLiked {
                like()
            } else {
                dislike()
            }
        }
    }
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

private extension UILikeButton {
    func setup() {
        setBackgroundImage(Icon.heart, for: .normal)
        tintColor = .red
        addTarget(self, action: #selector(onHeartPress), for: .touchUpInside)
    }
    
    @objc
    func onHeartPress() {
        isLiked.toggle()
    }
    
    func like() {
        setBackgroundImage(Icon.fillHeart, for: .normal)
    }
    
    func dislike() {
        setBackgroundImage(Icon.heart, for: .normal)
    }
}
