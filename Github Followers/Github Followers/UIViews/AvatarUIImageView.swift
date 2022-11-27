//
//  AvatarUIImageView.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/25/22.
//

import UIKit

class AvatarUIImageView: UIImageView {
    let avatarPlaceholderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUIImageView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = avatarPlaceholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
