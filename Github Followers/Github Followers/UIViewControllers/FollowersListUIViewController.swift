//
//  FollowersListViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/21/22.
//

import UIKit

class FollowersListUIViewController: UIViewController {

    var username: String!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUIViewController()
        configureUICollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true) // Show the navigation bar.
    }
    
    func configureUIViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureUICollectionView() {
        // Create an instance of a UICollectionView.
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        // Add object to main view (self).
        view.addSubview(collectionView)
        // Set background color of UICollectionView
        collectionView.backgroundColor = .systemPink
        // Register cell in collection view.
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
    }
    
    func getFollowers() {
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
}
