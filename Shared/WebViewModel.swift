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
        webView = WKWebView(frame: .zero)
        url = URL(string: "")!
        loadUrl()
    }
    // actions
    func loadUrl() {
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
