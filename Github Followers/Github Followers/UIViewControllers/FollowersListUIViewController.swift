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
        
        NetworkSingleton.shared.getFollowers(username: username, page: 1) { (result) in
            
            switch result {
            case .success(let followers):
                print(followers)
                break
            case.failure(let error):
                self.presentAlertUIViewControllerOnMainThread(title: "Error", body: error.rawValue, buttonTitle: "Ok")
                break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true) // Show the navigation bar.

    }
    
}
