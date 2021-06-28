//
//  WebviewViewModel.swift
//  NYT
//
//  Created by emir kartal on 28.06.2021.
//

import Foundation

final class WebviewViewModel: WebviewViewModelProtocol {
    weak var delegate: WebviewViewModelDelegate?
    var detailUrlString: String
    
    init(urlString: String) {
        detailUrlString = urlString
    }
    
    func load() {
        if let url = URL(string: detailUrlString) {
            notify(.load(url))
        }else {
            notify(.showError("Something went wrong!"))
        }
    }
    
    private func notify(_ output: WebviewViewModelOutput) {
        self.delegate?.handleWebviewViewModelOutput(output)
    }
    
}
