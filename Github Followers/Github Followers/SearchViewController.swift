//
//  SearchViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/17/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoUIImageView = UIImageView()
    let usernameUITextField = UsernameUITextField()
    let searchUIButton = SearchUIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUIImageView()
        configureUsernameUITextField()
        configureSearchUIButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureUIImageView() {
        view.addSubview(logoUIImageView)
        logoUIImageView.translatesAutoresizingMaskIntoConstraints = false
        logoUIImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoUIImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoUIImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoUIImageView.heightAnchor.constraint(equalToConstant: 200),
            logoUIImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func configureUsernameUITextField() {
        view.addSubview(usernameUITextField)
        
        usernameUITextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameUITextField.topAnchor.constraint(equalTo: logoUIImageView.bottomAnchor, constant: 50),
            usernameUITextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameUITextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameUITextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureSearchUIButton() {
        view.addSubview(searchUIButton)
        searchUIButton.set(color: .green, title: "Get Followers", imageSystemName: "")
        
        searchUIButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchUIButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchUIButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchUIButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchUIButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
