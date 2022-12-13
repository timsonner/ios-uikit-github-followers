//
//  Layouts.swift
//  Github Followers
//
//  Created by Timothy Sonner on 12/8/22.
//

import UIKit

func createUICollectionViewLayoutThreeColumns(view: UIView) -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let minimumItemSpacing: CGFloat = 10
    // Padding outer cell left (1), outer cell right (2) (2 total), spacing middle column cell left (1), spacing middle column right (2) (2 total).
    let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
    let itemWidth = availableWidth / 3
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
    return flowLayout
}
