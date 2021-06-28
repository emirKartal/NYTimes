//
//  ViewControllerExtensions.swift
//  NYT
//
//  Created by emir kartal on 28.06.2021.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
