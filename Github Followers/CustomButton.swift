//
//  CustomButton.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/20/22.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    // MARK: Init
    // Init for UIButton.
    override init(frame: CGRect) {
        // Create a UIButton.
        super.init(frame: frame)
        configure()
    }
    
    // Init for story boards.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Init to pass background color and title to button.
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    // MARK: Functions
    // Configure all sub classes.
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // Set for autolayout purposes.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
