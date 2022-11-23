//
//  BodyUILabel.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/21/22.
//

import UIKit

class BodyUILabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBodyUILabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        configureBodyUILabel()
    }
    
    private func configureBodyUILabel() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true // Try to fit text content.
        minimumScaleFactor = 0.6 // Shrink, but not too much.
        lineBreakMode = .byWordWrapping
        
        // Storyboard.
        translatesAutoresizingMaskIntoConstraints = false
    }

}
