//
//  RootRouter.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation
import UIKit

class RootRouter {

    func setRootViewController(controller: UIViewController, animatedWithOptions: UIView.AnimationOptions?) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("No window in app")
        }
        if let animationOptions = animatedWithOptions, window.rootViewController != nil {
            window.rootViewController = controller
            UIView.transition(with: window, duration: 0.33, options: animationOptions, animations: {
            }, completion: nil)
        } else {
            window.rootViewController = controller
        }
    }

    func loadMainAppStructure() {
        let controller = HomeBuilder.make(viewModel: HomeViewModel())
        setRootViewController(controller: controller, animatedWithOptions: nil)
    }
}

