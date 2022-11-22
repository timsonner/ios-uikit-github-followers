//
//  SearchViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/17/22.
//

import UIKit
import SwiftUI

class SearchViewController: UIViewController {
    
    let logoUIImageView = UIImageView()
    let usernameUITextField = UsernameUITextField()
    let searchUIButton = SearchUIButton()
    
    // MARK: Initial load of SearchViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // Set view background color.
        configureLogoUIImageView() // Display logo image.
        configureUsernameUITextField() // Display text field.
        configureSearchUIButton() // Display search button.
        createKeyboardDismissTapGesture()
    }
    
    // MARK: Called every time view is rendered.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true // Hide navigation bar.
    }
    
    // MARK: Actions
    @objc func pushFollowersListViewcontroller() {
        // Create instance of UIViewController.
        let followersListViewController = FollowersListViewController()
        
        // Set the username property of the UIViewController.
        followersListViewController.username = usernameUITextField.text
        
        // Set navigation bar title.
        followersListViewController.title = usernameUITextField.text
        
        // Push the UIViewController on to the stack of views.
        navigationController?.pushViewController(followersListViewController, animated: true)
        // Set navigation bar title to large title style.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NSLog("❎ pushFollowersListViewController Action called.")
    }
    
    // MARK: Tap Gesture
    // Make keyboard disappear on tap away.
    func createKeyboardDismissTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view.self, action: #selector(UIView.endEditing(_:))) // Take away first responder status from the keyboard.
        view.addGestureRecognizer(tapGesture) // Add tap gesture to view controller.
    }
    
    // MARK: logoUIImageView
    func configureLogoUIImageView() {
        view.addSubview(logoUIImageView)
        // Storyboard.
        logoUIImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Image asset.
        logoUIImageView.image = UIImage(named: "gh-logo")
        
        // Constraints.
        NSLayoutConstraint.activate([
            logoUIImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoUIImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoUIImageView.heightAnchor.constraint(equalToConstant: 200),
            logoUIImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: usernameUITextField
    func configureUsernameUITextField() {
        view.addSubview(usernameUITextField)
        
        // Set delegate of UITextField.
        usernameUITextField.delegate = self // This view controller is now the delegate of this UITextField.
        
        // Storyboard.
        usernameUITextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints.
        NSLayoutConstraint.activate([
            usernameUITextField.topAnchor.constraint(equalTo: logoUIImageView.bottomAnchor, constant: 50),
            usernameUITextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameUITextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameUITextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: searchUIButton
    func configureSearchUIButton() {
        view.addSubview(searchUIButton)
        
        searchUIButton.addTarget(self, action: #selector(pushFollowersListViewcontroller), for: .touchUpInside)
        
        // Convenience init from SearchUIButton.
        searchUIButton.set(color: .green, title: "Get Followers", imageSystemName: "person.3")
        
        // Storyboard.
        searchUIButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Contraints.
        NSLayoutConstraint.activate([
            searchUIButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchUIButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchUIButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchUIButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: Extensions
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("❎ Delegate SearchViewController detected an event.")
        pushFollowersListViewcontroller()
        return true
    }
}

// MARK: SwiftUI ViewControllerRepresentable
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = SearchViewController
    
    func makeUIViewController(context: Context) -> SearchViewController {
        SearchViewController()
    }
    
    func updateUIViewController(_ uiViewController: SearchViewController, context: Context) {
        
    }
}

// MARK: SwiftUI Preview
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
