//
//  HomePresentationModel.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation

struct HomePresentationModel {
    let title: String?
    let abstract: String?
    let url: String?
    
    init(storyModel: StoryResultModel) {
        title = storyModel.title
        abstract = storyModel.abstract
        url = storyModel.url
    }
}
