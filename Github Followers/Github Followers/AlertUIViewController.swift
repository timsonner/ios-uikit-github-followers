//
//  AlertUIViewController.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/21/22.
//

import UIKit

class AlertUIViewController: UIViewController {
    let padding: CGFloat = 20

    let containerUIView = UIView()
    let titleUILabel = TitleUILabel(textAlignment: .center, fontSize: 20)
    let bodyUILabel = BodyUILabel(textAlignment: .center)
    let buttonUIButton = ButtonUIButton(color: .systemPink, title: "OK", imageSystemName: "alert")
    
    var alertTitle: String?
    var alertBody: String?
    var buttonTitle: String?
    
    init(alertTitle: String? = nil, alertBody: String? = nil, buttontitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.alertBody = alertBody
        self.buttonTitle = buttontitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configureContainerUIView()
        configureLabelUILabel()
        configureButtonUIButton()
        configureBodyUILabel()
    }
    
    func configureContainerUIView() {
        view.addSubview(containerUIView)
        containerUIView.backgroundColor = .systemBackground
        containerUIView.layer.cornerRadius = 16
        containerUIView.layer.borderWidth = 2
        containerUIView.layer.borderColor = UIColor.white.cgColor
        
        // Storyboard.
        containerUIView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerUIView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerUIView.heightAnchor.constraint(equalToConstant: 220),
            containerUIView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureLabelUILabel() {
        containerUIView.addSubview(titleUILabel)
        titleUILabel.text = alertTitle ?? "Error..."
        titleUILabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleUILabel.topAnchor.constraint(equalTo: containerUIView.topAnchor, constant: padding),
            titleUILabel.leadingAnchor.constraint(equalTo: containerUIView.leadingAnchor, constant: padding),
            titleUILabel.trailingAnchor.constraint(equalTo: containerUIView.trailingAnchor, constant: -padding),
            titleUILabel.heightAnchor.constraint(equalToConstant: 28)
        
        ])
    }
    
    func configureButtonUIButton() {
        containerUIView.addSubview(buttonUIButton)
        buttonUIButton.setTitle(buttonTitle, for: .normal)
        buttonUIButton.addTarget(self, action: #selector(dismissUIViewController), for: .touchUpInside)
        
        buttonUIButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonUIButton.bottomAnchor.constraint(equalTo: containerUIView.bottomAnchor, constant: -padding),
            buttonUIButton.leadingAnchor.constraint(equalTo: containerUIView.leadingAnchor, constant: padding),
            buttonUIButton.trailingAnchor.constraint(equalTo: containerUIView.trailingAnchor, constant: -padding),
            buttonUIButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func dismissUIViewController() {
        dismiss(animated: true)
    }
    
    func configureBodyUILabel() {
        containerUIView.addSubview(bodyUILabel)
        bodyUILabel.text = alertBody ?? "No data on error"
        bodyUILabel.numberOfLines = 4
        
        bodyUILabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bodyUILabel.topAnchor.constraint(equalTo: titleUILabel.bottomAnchor, constant: 8),
            bodyUILabel.leadingAnchor.constraint(equalTo: containerUIView.leadingAnchor, constant: 20),
            bodyUILabel.trailingAnchor.constraint(equalTo: containerUIView.trailingAnchor, constant: -padding),
            bodyUILabel.bottomAnchor.constraint(equalTo: buttonUIButton.topAnchor, constant: -12)
            
        
        ])
        
    }
    
}
