//
//  MainNavigationViewController.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = .black
        
        // Delete Back button title
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        let attributes = [NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!, NSAttributedString.Key.foregroundColor: UIColor.clear]
        barButtonItemAppearance.setTitleTextAttributes(attributes, for: .normal)
        barButtonItemAppearance.setTitleTextAttributes(attributes, for: .highlighted)
    }
    
}
