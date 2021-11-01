//
//  WebView.swift
//  nPlay
//
//  Based on code from https://benoitpasquier.com/create-webview-in-swiftui/
//

import Foundation
import WebKit
import UIKit
import SwiftUI

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
