//
//  FavoritesUIViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/17/22.
//

import UIKit
import SwiftUI

class FavoritesUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    
    
    // MARK: SwiftUI ViewControllerRepresentable
    struct ViewControllerRepresentable: UIViewControllerRepresentable {
        typealias UIViewControllerType = FavoritesUIViewController
        
        func makeUIViewController(context: Context) -> FavoritesUIViewController {
            FavoritesUIViewController()
        }
        
        func updateUIViewController(_ uiViewController: FavoritesUIViewController, context: Context) {
            
        }
    }

    // MARK: SwiftUI Preview
    struct ViewController_Previews: PreviewProvider {
        static var previews: some View {
            ViewControllerRepresentable()
        }
    }
 
}





