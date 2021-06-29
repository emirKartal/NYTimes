//
//  ImageViewExtension.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImageViewWithUrl(urlString: String) {
        self.kf.indicatorType = .activity
        let url = URL(string: urlString)
        let resource = ImageResource(downloadURL: url!)
        self.kf.setImage(
            with: resource,
            placeholder: nil,
            options: [
                .processor(DownsamplingImageProcessor(size: self.bounds.size)),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ])
    }
}
