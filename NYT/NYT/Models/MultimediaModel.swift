//
//  MultimediaModel.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import Foundation

struct MultimediaModel: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
}
