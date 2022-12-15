//
//  FollowerCollectionViewCell.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/25/22.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    // Set reuse identifier
    static let reuseID = "followerCell"
    // Create instance of UIImageView to display follower image
    var followerAvatar = AvatarUIImageView(frame: .zero)
    // Create UILabel to display follower username
    let followerName = TitleUILabel(textAlignment: .center, fontSize: 16)
    // Static padding for reuse throughout layout.
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Call configure method as soon as view is loaded.
        configureUICollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Called from outside this class to set it's data source
    func set(follower: FollowerModel) {
        followerName.text = follower.login
        followerAvatar.downloadImage(urlString: follower.avatarUrl)
    }
    
    // Add any subviews and constraints to the view.
    private func configureUICollectionViewCell() {
        addSubview(followerAvatar)
        addSubview(followerName)
        
        // For UIImage to scale to fit, .containerView is omitted from .constraint().
        NSLayoutConstraint.activate([
            followerAvatar.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            followerAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            followerAvatar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            followerAvatar.heightAnchor.constraint(equalTo: followerAvatar.widthAnchor),
        
            followerName.topAnchor.constraint(equalTo: followerAvatar.bottomAnchor, constant: 12),
            followerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            followerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            followerName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

