//
//  HomeContracts.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? {get set}
    func getStories()
}

protocol HomeViewModelDelegate: AnyObject {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput)
    func navigate(to route: HomeRouter)
}

enum HomeViewModelOutput: Equatable {
    case isLoading(Bool)
    case showStories([StoryResultModel])
    case showError(String)
}

enum HomeRouter {
    case toStoryDetail
}
