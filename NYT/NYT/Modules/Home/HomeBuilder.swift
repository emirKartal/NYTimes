//
//  HomeBuilder.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import UIKit

final class HomeBuilder {
    class func make(viewModel: HomeViewModel)-> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeVC.viewModel = viewModel
        return homeVC
    }
}
