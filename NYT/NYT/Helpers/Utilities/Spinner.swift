//
//  Spinner.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation
import UIKit

class Spinner {
    static var spinner: UIActivityIndicatorView?
    
    class func start(frame: CGRect = UIScreen.main.bounds, color: UIColor = .black, scale: CGFloat = 1) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = frame
            spinner = UIActivityIndicatorView(frame: frame)
            spinner?.color = color
            if scale != 1 {
                spinner?.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }
    class func stop() {
        if spinner != nil {
            spinner!.stopAnimating()
            spinner!.removeFromSuperview()
            spinner = nil
        }
    }
}
