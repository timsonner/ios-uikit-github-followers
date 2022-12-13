//
//  FollowersListViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/21/22.
//

import UIKit

class FollowersUICollectionViewViewController: UIViewController {
    
    // Section of collection view.
    enum Section {
        case main
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, FollowerModel>!
    var username: String!
    var followers: [FollowerModel] = []
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUIViewController()
        configureUICollectionView()
        getFollowers()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true) // Show the navigation bar.
    }
    
    func configureUIViewController() {
        // Set background of UIViewController (self).
        view.backgroundColor = .systemBackground
        // Set title preference for navigation bar.
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureUICollectionView() {
        // Create an instance of a UICollectionView.
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createUICollectionViewLayoutThreeColumns(view: view))
        // Add subview to this UIViewController (self).
        view.addSubview(collectionView)
        // Set background color of UICollectionView
        collectionView.backgroundColor = .systemBackground
        // Register cell in collection view.
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
    }
    
    func getFollowers() {
        NetworkSingleton.shared.getFollowers(username: username, page: 1) { [weak self] (result) in // capture list
            
            // weak self for Automatic Reference Counting
            guard let self = self else {
                return
            }
                    switch result {
                    case .success(let followers):
                        self.followers = followers
                        self.updateData()
                        print(followers)
                        break
                    case.failure(let error):
                        self.presentAlertUIViewControllerOnMainThread(title: "Error", body: error.rawValue, buttonTitle: "Ok")
                break
            }
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as! FollowerCollectionViewCell
            
            // Pass data from data source to the UICollectionViewCell.
            cell.set(follower: itemIdentifier)
            return cell
        })
    }
    
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, FollowerModel>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        // Switch to main thread to update UI.
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
}
