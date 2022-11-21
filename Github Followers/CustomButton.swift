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
    
    // Init super.
    override init(frame: CGRect) {
        // Create a UIButton.
        super.init(frame: frame)
        configure()
    }
    
    // Init for story board.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Init to pass background color and title to button.
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        set(color: backgroundColor, title: title)
    }
    
    // MARK: Functions
    // Configure all sub classes.
    private func configure() {
        // Configuration for button appearance.
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        
        // Set for autolayout purposes.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Set foreground and background color of button.
    final func set(color: UIColor, title: String) {
        configuration?.title = title
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
    }
    
}
