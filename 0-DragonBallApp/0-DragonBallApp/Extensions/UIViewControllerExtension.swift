//
//  UIViewControllerExtension.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 6/11/22.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
