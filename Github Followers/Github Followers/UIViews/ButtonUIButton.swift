//
//  ButtonUIButton.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/20/22.
//

import Foundation
import UIKit

class ButtonUIButton: UIButton {
    // MARK: Init
    
    // Init super.
    override init(frame: CGRect) {
        // Create a base UIButton.
        super.init(frame: frame)
        // Configure the base button.
        configureButtonUIButton()
    }
    
    // Init storyboard.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Init to pass background color and title to button.
    convenience init(color: UIColor, title: String, imageSystemName: String) {
        self.init(frame: .zero) // .zero is shortcut for CGRect(0,0,0,0)
        // Set background color and title.
        set(color: color, title: title, imageSystemName: imageSystemName)
    }
    
    // MARK: Functions
    // Configure all sub classes.
    private func configureButtonUIButton() {
        // Configuration for button appearance.
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        
        // Super view controller will provide constraints.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Set foreground and background color of button.
    final func set(color: UIColor, title: String, imageSystemName: String) {
        configuration?.title = title
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.image = UIImage(systemName: imageSystemName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}

