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
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureUICollectionView() {
        // Create an instance of a UICollectionView.
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createUICollectionViewLayoutThreeColumns())
        // Add object to main view (self).
        view.addSubview(collectionView)
        // Set background color of UICollectionView
        collectionView.backgroundColor = .systemBackground
        // Register cell in collection view.
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
    }
    
    func createUICollectionViewLayoutThreeColumns() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        // Padding outer cell left (1), outer cell right (2) (2 total), spacing middle column cell left (1), spacing middle column right (2) (2 total).
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
    func getFollowers() {
        NetworkSingleton.shared.getFollowers(username: username, page: 1) { (result) in
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
            cell.set(follower: itemIdentifier)
            return cell
        })
    }
    
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, FollowerModel>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
}
