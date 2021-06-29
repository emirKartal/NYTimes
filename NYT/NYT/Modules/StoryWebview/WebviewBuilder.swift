//
//  WebviewBuilder.swift
//  NYT
//
//  Created by emir kartal on 28.06.2021.
//

import UIKit

final class WebviewBuilder {
    class func make(viewModel: WebviewViewModelProtocol)-> WebviewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webVC = storyboard.instantiateViewController(withIdentifier: "WebviewController") as! WebviewController
        webVC.viewModel = viewModel
        return webVC
    }
}
