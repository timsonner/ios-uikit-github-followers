//
//  TitleUILabel.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/21/22.
//

import UIKit

class TitleUILabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleUILabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configureTitleUILabel()
    }
    
    private func configureTitleUILabel() {
        textColor = .label
        adjustsFontSizeToFitWidth = true // Try to fit text content.
        minimumScaleFactor = 0.9 // Shrink, but not too much.
        lineBreakMode = .byTruncatingTail // Terminate title with "...".
        // Storyboard.
        translatesAutoresizingMaskIntoConstraints = false
    }
}
