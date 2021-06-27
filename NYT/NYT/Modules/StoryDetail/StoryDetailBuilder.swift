//
//  StoryDetailBuilder.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import UIKit

final class StoryDetailBuilder {
    class func make(viewModel: StoryDetailViewModelProtocol)-> StoryDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "StoryDetailViewController") as! StoryDetailViewController
        detailVC.viewModel = viewModel
        return detailVC
    }
}
