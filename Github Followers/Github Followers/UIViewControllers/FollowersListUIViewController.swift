//
//  FollowersListViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/21/22.
//

import UIKit

class FollowersListUIViewController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        NetworkSingleton.shared.getFollowers(username: username, page: 1) { (followers, error) in
            guard let followers = followers else {
                self.presentAlertUIViewControllerOnMainThread(title: "UIViewcontroller error", body: error!, buttonTitle: "OK")
                return
            }
            print(followers)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true) // Show the navigation bar.

    }
    
}
