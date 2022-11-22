//
//  FavoritesListViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/17/22.
//

import UIKit
import SwiftUI

class FavoritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    
    
    // MARK: SwiftUI ViewControllerRepresentable
    struct ViewControllerRepresentable: UIViewControllerRepresentable {
        typealias UIViewControllerType = FavoritesViewController
        
        func makeUIViewController(context: Context) -> FavoritesViewController {
            FavoritesViewController()
        }
        
        func updateUIViewController(_ uiViewController: FavoritesViewController, context: Context) {
            
        }
    }

    // MARK: SwiftUI Preview
    struct ViewController_Previews: PreviewProvider {
        static var previews: some View {
            ViewControllerRepresentable()
        }
    }
 
}





