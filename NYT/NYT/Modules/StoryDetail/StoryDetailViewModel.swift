//
//  StoryDetailViewModel.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation

final class StoryDetailViewModel: StoryDetailViewModelProtocol {
    weak var delegate: StoryDetailViewModelDelegate?
    private var storyDetail: StoryResultModel
    
    init(storyDetail: StoryResultModel) {
        self.storyDetail = storyDetail
    }
    
    func setStory() {
        self.notify(.setStoryElements(self.storyDetail))
    }
    
    func openWebView() {
        let viewModel = WebviewViewModel()
        navigate(to: .toWebView(viewModel))
    }
    
    private func notify(_ output: StoryDetailViewModelOutput) {
        delegate?.handleStoryDetailViewModelOutput(output)
    }
    
    private func navigate(to route: StoryDetailRouter) {
        delegate?.navigate(to: route)
    }
    
}
