//
//  HomeBuilder.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import UIKit

final class HomeBuilder {
    class func make(viewModel: HomeViewModel)-> MainNavigationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "MainNavigationViewController") as! MainNavigationViewController
        let homeVC = navigationController.viewControllers.first as! HomeViewController
        homeVC.viewModel = viewModel
        return navigationController
    }
}
