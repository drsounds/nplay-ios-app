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
import HybridCamera

struct CameraView: UIViewRepresentable {
    typealias UIViewType = HybridCamView

    let hybridCameraView: HybridCamView
    
    func makeUIView(context: Context) -> HybridCamView {
        return hybridCameraView
    }
    
    func updateUIView(_ uiView: HybridCamView, context: Context) { }
}


