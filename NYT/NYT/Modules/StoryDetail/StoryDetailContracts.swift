//
//  StoryDetailContracts.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation

protocol StoryDetailViewModelProtocol {
    var delegate: StoryDetailViewModelDelegate? {get set}
    func setStory()
}

protocol StoryDetailViewModelDelegate {
    func handleStoryDetailViewModelOutput(_ output: StoryDetailViewModelOutput)
    func navigate(to router: StoryDetailRouter)
}

enum StoryDetailViewModelOutput {
    case setStoryElements(StoryResultModel)
}

enum StoryDetailRouter {
    
}
