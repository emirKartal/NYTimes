//
//  StoryModel.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation

struct StoryModel: Codable {
    let status: String?
    let copyright: String?
    let section: String?
    let lastUpdated: Date?
    let numResults: Int?
    let results: [StoryResultModel]?
}

struct StoryResultModel: Codable {
    let section: String?
    let subsection: String?
    let title: String?
    let abstract: String?
    let url: String?
    let uri: String?
    let byline: String?
    let updatedDate: String?
    let createdDate: String?
    let publishedDate: String?
    let multimedia: [MultimediaModel]?
}
