//
//  WebViewController.swift
//  NYT
//
//  Created by emir kartal on 28.06.2021.
//

import UIKit

final class WebviewController: UIViewController {
    
    var viewModel: WebviewViewModelProtocol! {
        didSet{
            self.viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension WebviewController: WebviewViewModelDelegate {
    func handleWebviewViewModelOutput(_ output: WebviewViewModelOutput) {
        
    }
}
