//
//  WebviewContracts.swift
//  NYT
//
//  Created by emir kartal on 28.06.2021.
//

import Foundation

protocol WebviewViewModelProtocol {
    var delegate: WebviewViewModelDelegate? {get set}
}

protocol WebviewViewModelDelegate: AnyObject {
    func handleWebviewViewModelOutput(_ output: WebviewViewModelOutput)
}

enum WebviewViewModelOutput {
    case load(String)
}
