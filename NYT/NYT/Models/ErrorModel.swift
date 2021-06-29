//
//  ErrorModel.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation

struct ErrorModel: Codable {
    
    let fault: FaultModel?
    
    struct FaultModel: Codable {
        let faultstring: String?
        
        struct DetailModel: Codable {
            let errorcode: String?
        }
    }
}
