//
//  HomeViewModel.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    private var service: NYTimesStoryService!
    var delegate: HomeViewModelDelegate?
    
    init(isMock: Bool = false) {
        self.service = NYTimesStoryService(isMock: isMock)
    }
    
    func getStories() {
        notify(.isLoading(true))
        service.getTopStories { [weak self] result in
            guard let self = self else {return}
            self.notify(.isLoading(false))
            switch result {
            case .success(let story):
                self.notify(.showStories(story.results ?? []))
                break
            case .failure(let error):
                self.notify(.showError(error.localizedDescription))
                break
            }
        }
    }
    
    private func notify(_ output: HomeViewModelOutput) {
        delegate?.handleHomeViewModelOutput(output)
    }
    
    private func navigate(to route: HomeRouter) {
        delegate?.navigate(to: route)
    }
}
