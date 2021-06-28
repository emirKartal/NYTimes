//
//  WebviewContracts.swift
//  NYT
//
//  Created by emir kartal on 28.06.2021.
//

import Foundation

protocol WebviewViewModelProtocol {
    var delegate: WebviewViewModelDelegate? {get set}
    var detailUrlString: String {get set}
    func load()
}

protocol WebviewViewModelDelegate: AnyObject {
    func handleWebviewViewModelOutput(_ output: WebviewViewModelOutput)
}

enum WebviewViewModelOutput {
    case load(URL)
    case showError(String)
}
