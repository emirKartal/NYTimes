//
//  Decoders.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation

public enum Decoders {
    public static let mainDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Decoders.dateFormat
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public static let dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ" //2021-06-24T04:49:41-04:00"
}
