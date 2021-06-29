//
//  HomeCellViewModel.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation

struct HomeCellViewModel {
    var imageUrl: String
    var title: String
    var author: String
    
    init(storyModel: StoryResultModel) {
        self.imageUrl = storyModel.multimedia?[1].url ?? ""
        self.title = storyModel.title ?? ""
        self.author = storyModel.byline ?? ""
    }
}
