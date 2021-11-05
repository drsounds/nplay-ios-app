//
//  WebViewModel.swift
//  nPlay
//
//  Based on code example from https://benoitpasquier.com/create-webview-in-swiftui/
// 
//

import Foundation
import WebKit

class WebViewModel: ObservableObject {
    
    let webView: WKWebView
    let url: URL
    // inputs
    @Published var urlString: String = ""

    init() {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        webView = WKWebView(frame: .zero, configuration: configuration)
        url = URL(string: "https://svt.se")!
    }
    // actions
    func loadUrl() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    // actions
    func loadUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    func goForward() {
        webView.goForward()
    }
    
    func goBack() {
        webView.goBack()
    }
}
