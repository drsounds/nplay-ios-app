//
//  BundlePlayer.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-01.
//

import SwiftUI
import WebKit

struct BundlePlayer: View {
    var bundle : Bundle
    @StateObject var model = WebViewModel()
    var body: some View {
        WebView(webView: model.webView).onAppear(perform: {
        })
    }
}
 
