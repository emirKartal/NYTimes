//
//  ServiceProtocol.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation
import Moya

protocol ServiceProtocol: ErrorProtocol {
    var provider: MoyaProvider<NYTimesAPI>! { get set }
    init(isMock:Bool)
}
extension ServiceProtocol {
    func moyaPlugins() -> [PluginType] {
        return [StatusCodePlugin()]
    }
}
