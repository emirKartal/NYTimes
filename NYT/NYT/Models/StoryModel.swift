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
    
}
