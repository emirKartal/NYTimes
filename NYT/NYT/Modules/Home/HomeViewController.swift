//
//  ViewController.swift
//  NYT
//
//  Created by emir kartal on 25.06.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getStories()
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .isLoading(let isLoading):
            break
        case .showStories(let storyList):
            print(storyList.count)
            break
        case .showError(let errorMessage):
            print(errorMessage)
            break
        }
    }
    
    func navigate(to route: HomeRouter) {
        
    }
}
