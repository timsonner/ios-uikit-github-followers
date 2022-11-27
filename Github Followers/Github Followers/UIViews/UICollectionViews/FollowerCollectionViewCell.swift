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
    
    let followerAvatar = AvatarUIImageView(frame: .zero)
    let followerName = TitleUILabel(textAlignment: .center, fontSize: 16)
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUICollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: FollowerModel) {
        followerName.text = follower.login
    }
    
    
    private func configureUICollectionViewCell() {
        addSubview(followerAvatar)
        addSubview(followerName)
        
        NSLayoutConstraint.activate([
            followerAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            followerAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            followerAvatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            followerAvatar.heightAnchor.constraint(equalTo: followerAvatar.widthAnchor),
        
            
            followerName.topAnchor.constraint(equalTo: followerAvatar.bottomAnchor, constant: 12),
            followerName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            followerName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            followerName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
