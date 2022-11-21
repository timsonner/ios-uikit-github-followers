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
        configureCustomButton()
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
        configureCustomButton()
    }
    
    // MARK: Functions
    // Configure all sub classes.
    private func configureCustomButton() {
        // Configuration for button appearance.
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        
        // Set for autolayout purposes.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
