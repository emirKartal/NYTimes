//
//  WebViewController.swift
//  NYT
//
//  Created by emir kartal on 28.06.2021.
//

import UIKit
import WebKit

final class WebviewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    var viewModel: WebviewViewModelProtocol! {
        didSet{
            self.viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.load()
    }
    private func configure() {
        webview.navigationDelegate = self
    }
    
    @IBAction func closeAct(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension WebviewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host, host == "www.nytimes.com" {
            decisionHandler(.allow)
            return
        }
        decisionHandler(.cancel)
    }
}

extension WebviewController: WebviewViewModelDelegate {
    func handleWebviewViewModelOutput(_ output: WebviewViewModelOutput) {
        switch output {
        case .load(let url):
            let urlRequest = URLRequest(url: url)
            webview.load(urlRequest)
            break
        case .showError(let errorMessage):
            print(errorMessage)
            break
        }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Spinner.start()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Spinner.stop()
    }
}
