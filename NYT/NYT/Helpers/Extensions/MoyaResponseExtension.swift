//
//  MoyaResponseExtension.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation
import Moya

extension Moya.Response {
    func parseCodableModel<T: Codable>(type: T.Type)-> T? {
        do {
            let parsedModel = try Decoders.mainDecoder.decode(type.self, from: self.data)
            return parsedModel
        }catch {
            #if DEBUG
            print(error)
            #endif
            return nil
        }
    }
}
