//
//  ExtensionUIViewcontroller.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/22/22.
//

import UIKit

// Gives any resent an alert dialog on the main thread.
extension UIViewController {
    func presentAlertUIViewControllerOnMainThread(title: String, body: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertUIViewController = AlertUIViewController(alertTitle: title, alertBody: body, buttontitle: buttonTitle)
            alertUIViewController.modalPresentationStyle = .overFullScreen
            alertUIViewController.modalTransitionStyle = .crossDissolve
            self.present(alertUIViewController, animated: true)
        }
    }
}
