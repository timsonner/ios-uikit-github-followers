//
//  CustomUITextField.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/21/22.
//

import UIKit

class UsernameUITextField: UITextField {
    // MARK: Init
    // Init super
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUsernameUITextField()
    }
    
    // Init storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functions
    private func configureUsernameUITextField() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.backgroundColor = UIColor.systemGray4.cgColor // .cgColor converts UIColor to CGColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2) // Access UIFont
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder = "Enter a username"
    }
}
